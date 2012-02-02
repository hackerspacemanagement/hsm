class ToolCategory
  include Mongoid::Document
    has_many :tools
    
    validates_presence_of :name
end
