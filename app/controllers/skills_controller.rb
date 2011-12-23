class SkillsController < ApplicationController
    def index
    end
    
    def create
        @skill = Skill.new(params[:skill])
        if @skill.save
            flash[:notice] = "Dude, you are awesome. You've added a skill."
            redirect_to edit_users_skill_path
        else
            flash[:alert] = 'You broke something. :-('
            redirect_to edit_skills_path
        end
    end
  
    def new
        @skill = Skill.new
    end
end
