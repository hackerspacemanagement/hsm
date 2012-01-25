class Role < ActiveRecord::Base
    has_and_belongs_to_many :permissions
    
    has_many :user_role
    has_many :users, :through => :user_role
end
