require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe V1::FirmwaresController, type: :controller do

  create_user_company
  login_user

  before :all do
    Apartment::Tenant.switch!(@company.subdomain)
    @firmware = FactoryGirl.create(:firmware)
    @gateway = FactoryGirl.create(:gateway)
  end

  # This should return the minimal set of attributes required to create a valid
  # Firmware. As you add validations to Firmware, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {name: "TestString", path: 'StringTest'}
  }

  let(:invalid_attributes) {
    {path: nil}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FirmwaresController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all firmwares as @firmwares" do
      get :index, {}, valid_session
      expect(assigns(:firmwares)).to eq([@firmware])
    end
  end

  describe "GET #show" do

    it "assigns the requested firmware as @firmware as gateway" do
      auth_header = @gateway.create_new_auth_token
      request.headers['accept'] = auth_header['accept']
      request.headers['access-token'] = auth_header['access-token']
      request.headers['client'] = auth_header['client']
      request.headers['uid'] = auth_header['uid']

      get :show, {:id => @firmware.to_param}, valid_session
      expect(assigns(:firmware)).to eq(@firmware)
    end

    it "assigns the requested firmware as @firmware" do
      get :show, {:id => @firmware.to_param}, valid_session
      expect(assigns(:firmware)).to eq(@firmware)
    end

  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Firmware" do
        expect {
          post :create, {:firmware => valid_attributes}, valid_session
        }.to change(Firmware, :count).by(1)
      end

      it "assigns a newly created firmware as @firmware" do
        post :create, {:firmware => valid_attributes}, valid_session
        expect(assigns(:firmware)).to be_a(Firmware)
        expect(assigns(:firmware)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved firmware as @firmware" do
        post :create, {:firmware => invalid_attributes}, valid_session
        expect(assigns(:firmware)).to be_a_new(Firmware)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {path: "DifferentString"}
      }

      it "updates the requested firmware" do
        put :update, {:id => @firmware.to_param, :firmware => new_attributes}, valid_session
        @firmware.reload
        expect(@firmware.path).to eq(new_attributes[:path])
      end

      it "assigns the requested firmware as @firmware" do
        put :update, {:id => @firmware.to_param, :firmware => valid_attributes}, valid_session
        expect(assigns(:firmware)).to eq(@firmware)
      end
    end

    context "with invalid params" do
      it "assigns the firmware as @firmware" do
        put :update, {:id => @firmware.to_param, :firmware => invalid_attributes}, valid_session
        expect(assigns(:firmware)).to eq(@firmware)
      end
    end

  end

  describe "DELETE #destroy" do
    it "destroys the requested firmware" do
      expect {
        delete :destroy, {:id => @firmware.to_param}, valid_session
      }.to change(Firmware, :count).by(-1)
    end
  end
end