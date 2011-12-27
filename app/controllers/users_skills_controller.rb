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
        @users = User.all.collect {|s| [s.full_name, s.id] }
        @proficiency_levels = [0,1,2,3,4,5]
    end   
    
    def create
        @users_skill = UsersSkill.new(params[:users_skill])
        
        # Maker sure the user is either assigning it to them selves or is allowed to assign to others
        if current_user.id != @users_skill.user.id and !current_user.can_arbitrarily_add_skills?
            flash[:alert] = 'You are not authorized to give other users skills.'
            redirect_to new_users_skill_path
            return
        end
        
        # make sure the user is allowed to assign this role
        if @users_skill.skill.role_required_to_grant 
            if current_user.role != @users_skill.skill.role_required_to_grant
                flash[:alert] = 'You are not assigned to the Required Role for assigning this skill. Cannot assign'
                redirect_to new_users_skill_path
                return
            end
        end
         
        if @users_skill.save
            flash[:notice] = "Dude, you are awesome. You've added a skill!"
            redirect_to users_skills_path
        else
            flash[:alert] = 'You broke something. :-('
            redirect_to new_users_skill_path
        end
    end
end
