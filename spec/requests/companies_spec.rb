require 'rails_helper'

RSpec.describe "Companies", type: :request do
  let(:auth_request_header) {
    {
      'Accept' => 'application/vnd.mycompany+json; version=1',
    }
  }
  describe "GET /companies" do
    it "works! (now write some real specs)" do
      get companies_path, {}, auth_request_header
      expect(response).to have_http_status(200)
    end
  end
end
