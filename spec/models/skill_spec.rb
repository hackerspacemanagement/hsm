require 'spec_helper'

describe Skill do
    describe "creating skills" do
        before do
            @skill = Factory.create :skill, :name => "Test Skill"
        end
        
        it "can create skills" do
            @skill.name.should == "Test Skill"
        end
        
        it "can change name" do
            @skill.name = "Important Thing"
            @skill.name.should == "Important Thing"
        end
        
        it "can change description" do
            @skill.description = "This is important!"
            @skill.description.should == "This is important!"
        end
    end
     
    describe "restricted skill addition" do
        before do
            @permission = Permission.create :name => 'administrate'
            @permission.save 
            
            @adminrole = Factory.create :role, :name => "Administrator",
                                               :permissions => [Permission.where(:name => 'administrate').first]
            @admin = Factory.create :user, :first_name => "Admin",
                                           :last_name  => "User",
                                           :email      => "admin@example.com",
                                           :role => @adminrole
            
            @regularuser = Factory.create :user, :first_name => "Regular",
                                                 :last_name  => "User",
                                                 :email      => "me@example.com"
            @regularuser.confirm!
            
            @restrictedSkill = Factory.create :skill, :name => "Restricted Skill",
                                                      :role_required_to_grant => @adminrole
        end
        
        it "should allow admin to add any skill" do
            @restrictedSkill.assign_to @regularuser, @admin, 1
            
            @regularuser.skills.should have(1).skill
        end
        
        it "should not allow regular users to add restricted skills to themselves" do
            @restrictedSkill.assign_to @regularuser, @regularuser, 1
                                                   
            @regularuser.skills.should have(0).skill
        end
        
        it "should not allow regular users to add restricted skills to anyone else" do
            @restrictedSkill.assign_to @regularuser, @admin, 1
            
            @admin.skills.should have(0).skill
        end
    end
end
