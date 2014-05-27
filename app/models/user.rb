class User < ActiveRecord::Base


  has_many :user_roles, :dependent => :destroy
  has_many :roles, :through => :user_roles


  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
