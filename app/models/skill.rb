class Skill < ActiveRecord::Base
    has_many :users_skills
    has_many :users, :through => :users_skills
    
    validates_presence_of :name
end
