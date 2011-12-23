class UsersSkillsController < ApplicationController
    def index
       if params[:id] then
           @user = User.find(params[:id])
           @uskills = UsersSkill.where(:user_id => @user.id)
       else
           @uskills = UsersSkill.all
       end
    end
    
    def new
        @users_skills = UsersSkill.new
        @all_skills = Skill.all.collect {|s| [ s.name, s.id ] }
        @proficiency_levels = [0,1,2,3,4,5]
    end   
    
    def create
        @users_skill = UsersSkill.new(params[:users_skill])
        @users_skill.user_id = current_user.id
        if @users_skill.save
            flash[:notice] = "Dude, you are awesome. You've added a tool."
            redirect_to users_skills_path
        else
            flash[:alert] = 'You broke something. :-('
            redirect_to edit_users_skills_path(@users_skill)
        end
    end
end
