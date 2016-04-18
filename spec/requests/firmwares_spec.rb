require 'rails_helper'

RSpec.describe "Firmwares", type: :request do
  describe "GET /firmwares" do
    it "works! (now write some real specs)" do
      get firmwares_path
      expect(response).to have_http_status(200)
    end
  end
end
