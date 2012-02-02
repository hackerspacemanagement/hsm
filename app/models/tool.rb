class Tool 
  include Mongoid::Document
  include Mongoid::Timestamps

  #embeds_many :categories
  #embeds_many :attachments
  #embeds_many :images

  field :name
  field :identification_number
  field :description
  field :location
  field :borrowed_by
  field :borrowed_on, :type => Date
  
  validates_presence_of :name, :description

end
