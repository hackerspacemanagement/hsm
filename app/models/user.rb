class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name

  validates :first_name, :presence => true
  validates :last_name,  :presence => true

  def full_name
    "#{ first_name } #{ last_name }"
  end

  def gravatar_url size=80
    hash = Digest::MD5.hexdigest(email.downcase.strip)
    "http://www.gravatar.com/avatar/#{ hash }?s=#{ size }"
  end

end
