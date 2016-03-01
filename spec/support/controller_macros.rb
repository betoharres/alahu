module ControllerMacros

  def login_user
    before(:each) do
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
