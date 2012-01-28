class UsersSkill < ActiveRecord::Base
  belongs_to :skill
  belongs_to :user
  
  validates_presence_of :skill_id
  validates_presence_of :user_id  
  validates_presence_of :proficiency
  
end