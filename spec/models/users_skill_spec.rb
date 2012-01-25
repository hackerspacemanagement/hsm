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
    

end
