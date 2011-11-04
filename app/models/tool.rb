class Tool < ActiveRecord::Base
    validates :name, :presence => true
    validates :user_id, :presence => true  # may not be necessary due to linebelow -wb
    belongs_to :user
end
