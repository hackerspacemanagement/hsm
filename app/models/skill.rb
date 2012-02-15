class Skill < ActiveRecord::Base
  has_many :users_skills
  has_many :users, :through => :users_skills
  
  validates_presence_of :name
  
  def assign_to user, assignor, proficiency
    # Maker sure the user is either assigning it to them selves or is allowed to assign to others
    if assignor.id != user.id and !assignor.can_arbitrarily_add_skills?
      return false
    end
    
    # make sure the user is allowed to assign this role
    if self.role_required_to_grant 
      if !(assignor.is_an_administrator?) and (assignor.role != self.role_required_to_grant)
        return false
      end
    end
    
    user_skill = UsersSkill.new :user_id => user.id,  :skill_id => self.id, :proficiency => proficiency
    user_skill.save
    
    return user_skill
  end
end
