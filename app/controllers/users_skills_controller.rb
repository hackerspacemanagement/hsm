class UsersSkillsController < ApplicationController
    def index
       if params[:id] then
           @uskills = UsersSkill.find(params[:id])
       else
           @uskills = UsersSkill.all
       end
    end
    
    def new
        @users_skills = UsersSkill.new
        @all_skills = Skill.all.collect {|s| [ s.name, s.id ] }
        @proficiency_levels = [0,1,2,3,4,5]
    end
end
