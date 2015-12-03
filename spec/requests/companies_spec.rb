require 'rails_helper'

RSpec.describe "Companies", type: :request do

  before :all do
    User.delete_all
    @user = FactoryGirl.create(:user)
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
  describe "GET /companies" do
    it "works! (now write some real specs)" do
      get companies_path, {}, auth_request_header
      expect(response).to have_http_status(200)
    end
  end
end
