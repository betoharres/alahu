require 'rails_helper'

RSpec.describe "Permissions", type: :request do
  before :all do
    User.delete_all
    @user = FactoryGirl.create(:user_role).user
    Permission.create resourceable_type: 'Permission', ability: 15, role: @user.role
  end

  before :each do
    @auth_header = @user.create_new_auth_token
  end

  let(:auth_request_header) {
    {
      'Accept' => 'application/vnd.mycompany+json; version=1',
      'access-token' => @auth_header['access-token'],
      'client' => @auth_header['client'],
      'uid' => @auth_header['uid']
    }
  }
  describe "GET /permissions" do
    it "permissions#index" do
      get permissions_path, {}, auth_request_header
      expect(response).to have_http_status(200)
    end
  end
end
