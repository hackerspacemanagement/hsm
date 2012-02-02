class UserRole
  include Mongoid::Document

    belongs_to :role
    belongs_to :user
end
