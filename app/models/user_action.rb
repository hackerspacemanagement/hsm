class UserAction < ActiveRecord::Base
  belongs_to :user

  def object= new_object
    self.obj_type = new_object.class.to_s
    self.obj_id   = new_object.id
  end

  def object
    # FFR
    # http://infovore.org/archives/2006/08/02/getting-a-class-object-in-ruby-from-a-string-containing-that-classes-name/
    obj_class = Object.const_get(obj_type)
    obj_class.find obj_id
  rescue 
    false
  end

  def type
    event.to_s + " " + obj_type.to_s 
  end

  self.per_page = 10
end
