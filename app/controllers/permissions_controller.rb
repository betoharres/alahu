class PermissionsController < ApplicationController
  before_action :set_permission, only: [:show, :update, :destroy]

  # GET /permissions
  # GET /permissions.json
  def index
    @permissions = Permission.all

    render json: @permissions
  end

  # GET /permissions/1
  # GET /permissions/1.json
  def show
    render json: @permission
  end

  # POST /permissions
  # POST /permissions.json
  def create
    @permission = Permission.new(permission_params)

    if @permission.save
      render json: @permission, status: :created, location: @permission
    else
      render json: @permission.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /permissions/1
  # PATCH/PUT /permissions/1.json
  def update
    @permission = Permission.find(params[:id])

    if @permission.update(permission_params)
      head :no_content
    else
      render json: @permission.errors, status: :unprocessable_entity
    end
  end

  # DELETE /permissions/1
  # DELETE /permissions/1.json
  def destroy
    @permission.destroy

    head :no_content
  end

  private

    def set_permission
      @permission = Permission.find(params[:id])
    end

    def permission_params
      params.require(:permission).permit(:ability, :resourceable_id, :resourceable_type, :role_id)
    end
end
