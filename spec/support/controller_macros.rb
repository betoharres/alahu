module ControllerMacros

  def login_gateway
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:gateway]
      sign_in FactoryGirl.create(:gateway) # Using factory girl as an example
    end
  end

  def login_user
    before(:each) do
      # @request.env["devise.mapping"] = Devise.mappings[:user]
      # @user.confirm # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      # sign_in @user
      auth_header = @user.create_new_auth_token
      request.headers['accept'] = auth_header['accept']
      request.headers['access-token'] = auth_header['access-token']
      request.headers['client'] = auth_header['client']
      request.headers['uid'] = auth_header['uid']
    end
  end

  def create_user_company
    before(:all) do
      user_company = FactoryGirl.create(:user_company)
      @user = user_company.user
      @company = user_company.company
    end
  end

end
