require 'rails_helper'

RSpec.describe "Nodes", type: :request do

  before :all do
    user_company = FactoryGirl.create(:user_company)
    @user = user_company.user
    Apartment::Tenant.switch!(user_company.company.subdomain)
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

  describe "GET /nodes" do
    it "works! (now write some real specs)" do
      get nodes_path, {}, auth_request_header
      expect(response).to have_http_status(200)
    end
  end
end
