class Skill < ActiveRecord::Base
    has_many :users_skills, :dependent => true
    has_many :users, :through => :users_skills
end
