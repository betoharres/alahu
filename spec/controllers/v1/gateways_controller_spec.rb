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

RSpec.describe V1::GatewaysController, type: :controller do

  create_user_company
  login_user

  before :all do
    Apartment::Tenant.switch!(@company.subdomain)
    @gateway = FactoryGirl.create(:gateway)
  end

  # This should return the minimal set of attributes required to create a valid
  # Gateway. As you add validations to Gateway, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
     {
     email: 'gateway@test.com', password: 12345678,
     password_confirmation: 12345678, authorized: false
    }
  }

  let(:invalid_attributes) {
    {
     email: nil
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # GatewaysController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all gateways as @gateways" do
      get :index, {}, valid_session
      expect(assigns(:gateways)).to eq([@gateway])
    end
  end

  describe "GET #show" do
    it "assigns the requested gateway as @gateway" do
      get :show, {:id => @gateway.to_param}, valid_session
      expect(assigns(:gateway)).to eq(@gateway)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Gateway" do
        expect {
          post :create, {:gateway => valid_attributes}
        }.to change(Gateway, :count).by(1)
      end

      it "assigns a newly created gateway as @gateway" do
        post :create, {:gateway => valid_attributes}, valid_session
        expect(assigns(:gateway)).to be_a(Gateway)
        expect(assigns(:gateway)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved gateway as @gateway" do
        post :create, {:gateway => invalid_attributes}, valid_session
        expect(assigns(:gateway)).to be_a_new(Gateway)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {email: 'gatewayupdate@test.com'}
      }

      it "updates the requested gateway" do
        put :update, {:id => @gateway.to_param, :gateway => new_attributes}, valid_session
        @gateway.reload
        expect(@gateway.email).to eq(new_attributes[:email])
      end

      it "assigns the requested gateway as @gateway" do
        put :update, {:id => @gateway.to_param, :gateway => valid_attributes}, valid_session
        expect(assigns(:gateway)).to eq(@gateway)
      end

    end

    context "with invalid params" do
      it "assigns the gateway as @gateway" do
        put :update, {:id => @gateway.to_param, :gateway => invalid_attributes}, valid_session
        expect(assigns(:gateway)).to eq(@gateway)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested gateway" do
      expect {
        delete :destroy, {:id => @gateway.to_param}, valid_session
      }.to change(Gateway, :count).by(-1)
    end
  end

end
