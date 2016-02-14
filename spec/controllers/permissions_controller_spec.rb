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

RSpec.describe V1::PermissionsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Permission. As you add validations to Permission, be sure to
  # adjust the attributes here as well.
  create_user_company
  login_user

  before :all do
    Apartment::Tenant.switch!(@company.subdomain)
    @permission = FactoryGirl.create(:permission, role: @user.role,
                                     resourceable_id: @user.id)
  end

  let(:valid_attributes) {
    {
     ability: 15,
     resourceable_type: 'User',
     resourceable_id: nil,
     role_id: @user.role.id
    }
  }

  let(:invalid_attributes) {
    {ability: nil}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PermissionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all permissions as @permissions" do
      permissions = Permission.all
      permissions << [@permission]
      get :index, {}, valid_session
      expect(assigns(:permissions)).to eq(permissions)
    end
  end

  describe "GET #show" do
    it "assigns the requested permission as @permission" do
      get :show, {:id => @permission.to_param}, valid_session
      expect(assigns(:permission)).to eq(@permission)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Permission" do
        expect {
          post :create, {:permission => valid_attributes}, valid_session
        }.to change(Permission, :count).by(1)
      end

      it "assigns a newly created permission as @permission" do
        post :create, {:permission => valid_attributes}, valid_session
        expect(assigns(:permission)).to be_a(Permission)
        expect(assigns(:permission)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved permission as @permission" do
        post :create, {:permission => invalid_attributes}, valid_session
        expect(assigns(:permission)).to be_a_new(Permission)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {ability: 1}
      }

      it "updates the requested permission" do
        put :update, {:id => @permission.to_param, :permission => new_attributes}, valid_session
        @permission.reload
        expect(@permission.ability).to eq(new_attributes[:ability])
      end

      it "assigns the requested permission as @permission" do
        put :update, {:id => @permission.to_param, :permission => valid_attributes}, valid_session
        expect(assigns(:permission)).to eq(@permission)
      end
    end

    context "with invalid params" do
      it "assigns the permission as @permission" do
        put :update, {:id => @permission.to_param, :permission => invalid_attributes}, valid_session
        expect(assigns(:permission)).to eq(@permission)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested permission" do
      expect {
        delete :destroy, {:id => @permission.to_param}, valid_session
      }.to change(Permission, :count).by(-1)
    end
  end

end
