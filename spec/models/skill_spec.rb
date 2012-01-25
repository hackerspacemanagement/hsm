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
end
