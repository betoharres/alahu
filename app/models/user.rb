class User < ActiveRecord::Base
  has_many :users_companies
  has_many :companies, through: :users_companies

  has_one :user_role
  has_one :role, through: :user_role
  has_one :permission, as: :resourceable, dependent: :destroy

  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  # This might have no sense
  # after_create :add_permission_to_user
  #
  # def add_permission_to_user
  #   Permission.create resourceable_id: id, resourceable_type: self.class.to_s,
  #                     ability: 15        , role: nil
  # end
end
