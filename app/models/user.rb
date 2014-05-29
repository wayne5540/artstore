class User < ActiveRecord::Base

  has_many :user_roles, :dependent => :destroy
  has_many :roles, :through => :user_roles


  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_save :set_default_role

  def admin?
    is?(:admin)
  end


  def is?(role)
    roles.has_role?(role)
  end



  def set_default_role
    role = Role.find_by(name: "user")
    self.roles << role
  end

end
