require "rails_helper"

RSpec.describe FirmwaresController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/firmwares").to route_to("firmwares#index")
    end

    it "routes to #new" do
      expect(:get => "/firmwares/new").to route_to("firmwares#new")
    end

    it "routes to #show" do
      expect(:get => "/firmwares/1").to route_to("firmwares#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/firmwares/1/edit").to route_to("firmwares#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/firmwares").to route_to("firmwares#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/firmwares/1").to route_to("firmwares#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/firmwares/1").to route_to("firmwares#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/firmwares/1").to route_to("firmwares#destroy", :id => "1")
    end

  end
end
