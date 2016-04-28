require 'rails_helper'

RSpec.describe "GatewayRoles", type: :request do
  before :all do
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

  describe "GET /gateway_roles" do
    it "works! (now write some real specs)" do
      get gateway_roles_path, {}, auth_request_header
      expect(response).to have_http_status(200)
    end
  end
end
