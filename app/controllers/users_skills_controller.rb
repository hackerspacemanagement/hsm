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
        
        # make sure the user is allowed to assign this role
        if @users_skill.skill.role_required_to_grant 
            if !@users_skill.user.roles.find( @users_skill.skill.role_required_to_grant )
                flash[:alert] = 'You are not assigned to the Required Role for assigning this skill. Cannot assign'
                redirect_to edit_users_skills_path(@users_skill)
            end
        end
            
        if @users_skill.save
            flash[:notice] = "Dude, you are awesome. You've added a skill!"
            redirect_to users_skills_path
        else
            flash[:alert] = 'You broke something. :-('
            redirect_to edit_users_skills_path(@users_skill)
        end
    end
end
