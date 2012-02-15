class UsersSkillsController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:index, :show]
  
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
    user = User.find params[:users_skill][:user_id]
    skill = Skill.find params[:users_skill][:skill_id]
    proficiency = params[:users_skill][:proficiency]
    
    if uskill = skill.assign_to( user, current_user, proficiency)
      log_action "created", uskill
      flash[:notice] = "Great success!"
      redirect_to users_skills_path
    else
      flash[:alert] = "You were not able to save the skill."
      redirect_to new_users_skill_path(params[:users_skill])
    end
  end

  def show
    @userskill = UsersSkill.find params[:id]
    redirect_to skill_path @userskill.skill
  end
end
