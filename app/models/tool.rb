class Tool < ActiveRecord::Base
    validates :name, :presence => true
    validates :owner_id, :presence => true
end
