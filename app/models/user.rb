class User < ActiveRecord::Base
  has_many :users_companies
  has_many :companies, through: :users_companies

  has_one :user_role
  has_one :role, through: :user_role

  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
end
