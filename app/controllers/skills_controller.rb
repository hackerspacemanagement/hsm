class SkillsController < ApplicationController
    def index
        if params[:id] then
            @user = User.find(params[:id])
            @skills = @user.skills
        else
            @skills = Skill.all
        end
    end
    
    def new
    end
end
