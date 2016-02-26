require 'rails_helper'

RSpec.describe "Gateways", type: :request do
  describe "GET /gateways" do
    it "works! (now write some real specs)" do
      get gateways_path
      expect(response).to have_http_status(200)
    end
  end
end
