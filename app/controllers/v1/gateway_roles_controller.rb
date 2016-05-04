class V1::GatewayRolesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_gateway_role, only: [:show, :update, :destroy]

  # GET /gateway_roles
  # GET /gateway_roles.json
  def index
    @gateway_roles = GatewayRole.all
    authorize @gateway_roles

    render json: @gateway_roles
  end

  # GET /gateway_roles/1
  # GET /gateway_roles/1.json
  def show
    render json: @gateway_role
  end

  # POST /gateway_roles
  # POST /gateway_roles.json
  def create
    @gateway_role = GatewayRole.new(gateway_role_params)
    authorize @gateway_role

    if @gateway_role.save
      render json: @gateway_role, status: :created, location: @gateway_role
    else
      render json: @gateway_role.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gateway_roles/1
  # PATCH/PUT /gateway_roles/1.json
  def update
    if @gateway_role.update(gateway_role_params)
      head :no_content
    else
      render json: @gateway_role.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gateway_roles/1
  # DELETE /gateway_roles/1.json
  def destroy
    @gateway_role.destroy

    head :no_content
  end

  private

    def set_gateway_role
      @gateway_role = GatewayRole.find(params[:id])
      authorize @gateway_role
    end

    def gateway_role_params
      params.require(:gateway_role).permit(:gateway_id, :role_id)
    end
end
