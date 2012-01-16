class SkillsController < ApplicationController
    before_filter :authenticate_user!, :except => [:index, :show]
  
    def index
        @skills = Skill.all
    end
    
    def create
        @skill = Skill.new(params[:skill])
        if @skill.save
            flash[:notice] = "Dude, you are awesome. You've added a skill."
            redirect_to new_users_skill_path
        else
            flash[:alert] = 'You broke something. :-('
            redirect_to edit_skills_path
        end
    end
  
    def new
        @skill = Skill.new
        @roles = Role.all.collect {|r| [ r.name, r.id ]}
        @roles << ["None", ""]
    end
    
    def show
        if params[:id] then
            @skill = Skill.find(params[:id])
            @userskills = @skill.users_skills
        else
            flash[:alert] = 'No skill selected to show'
            redirect_to skills_path
        end
    end
end
