class V1::RolesController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized
  before_action :set_role, only: [:show, :update, :destroy]

  # GET /roles
  # GET /roles.json
  def index
    @roles = Role.all
    authorize @roles

    render json: @roles
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
    authorize @role
    render json: @role
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = Role.new(role_params)
    authorize @role

    if @role.save
      # TODO: create a controller to handle User x Role assignment
      # UserRole.create user: current_user, role: @role
      render json: @role, status: :created, location: @role
    else
      render json: @role.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
    authorize @role
    if @role.update(role_params)
      head :no_content
    else
      render json: @role.errors, status: :unprocessable_entity
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    authorize @role
    @role.destroy

    head :no_content
  end

  private

    def set_role
      @role = Role.find(params[:id])
    end

    def role_params
      params.require(:role).permit(:name, :ability)
    end
end
