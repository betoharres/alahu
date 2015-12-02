class UserCompany < ActiveRecord::Base
  self.table_name = 'users_companies'
  belongs_to :user
  belongs_to :company
end
