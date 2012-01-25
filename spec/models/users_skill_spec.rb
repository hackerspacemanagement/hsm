require 'spec_helper'

describe UsersSkill do

    
    describe "general skill addition" do
        before do
            @user = Factory.create :user, :first_name => "User",
                                          :last_name  => "One"
            @skill = Factory.create :skill, :name => "test skill"
            @uskill = Factory.create :users_skill, :skill => @skill,
                                                   :user => @user,
                                                   :proficiency => 1
        end 
        
        it "should have proficiency" do
            @uskill.proficiency.should == 1
            
            @uskill.proficiency = 2
            @uskill.proficiency.should ==2
        end
        
        it "should allow user to add general skill to self" do
            @uskill.skill.should == @skill
            @uskill.user.should == @user
            
            @uskill.save
            @user.skills.should have(1).skill
        end
        
        it "should allow user to remove skills from self" do
            @uskill.skill.should == @skill
            @uskill.user.should == @user
            
            @uskill.save
            @user.skills.should have(1).skill
            
            @user.skills.delete(@skill)
            @user.skills.should have(0).skill
        end
        
        it "should allow skill to find users that have it" do
            @user = @skill.users[0]
            
            @user.should
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
            
            @restrictedSkill = Factory.create :skill, :name => "Restricted Skill",
                                                      :role_required_to_grant => @adminrole
        end
        
        it "should allow admin to add any skill" do
            @uskill = Factory.create :users_skill, :skill => @restrictedSkill,
                                                   :user  => @regularuser,
                                                   :proficiency => 5
            
            @regularuser.skills.should have(1).skill
        end
    end
end
