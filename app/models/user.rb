class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :role

  validates_presence_of :first_name
  validates_presence_of :last_name

  belongs_to :role
  delegate :permissions, :to => :role

  before_validation(:on => :create) do
    if not self.role
        self.role = Role.where(:id => Settings.new_user_role).first
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def gravatar_url size=80
    hash = Digest::MD5.hexdigest(email.downcase.strip)
    "http://www.gravatar.com/avatar/#{hash}?s=#{size}"
  end

  has_many :skills, :through => :users_skills
  has_many :tools

  def has_permission?(perm)
    permissions.each do |perm|
        return true if perm.name == perm
    end
  end

  # Implements magic such as @user.is_an_admin_or_superhero?
  # and @user.can_fly?
  def method_missing(method_id, *args)
    if match = matches_dynamic_role_check?(method_id)
        tokenize_roles(match.captures.first).each do |check|
            return true if role and role.name.downcase == check
        end
        return false
    elsif match = matches_dynamic_perm_check?(method_id)
        return true if can_administrate?
        return true if role and permissions.find_by_name(match.captures.first)
        return false
    else
        super
    end
  end

  private

  def matches_dynamic_perm_check?(method_id)
    /^can_([a-zA-Z]\w*)\?$/.match(method_id.to_s)
  end

  def matches_dynamic_role_check?(method_id)
    /^is_an?_([a-zA-Z]\w*)\?$/.match(method_id.to_s)
  end

  def tokenize_roles(string_to_split)
    string_to_split.split(/_or_/)
  end

end
