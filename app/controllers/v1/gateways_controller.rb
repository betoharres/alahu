class V1::GatewaysController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized
  before_action :set_gateway, only: [:show, :update, :destroy]

  # GET /gateways
  # GET /gateways.json
  def index
    @gateways = Gateway.all
    authorize @gateways

    render json: @gateways
  end

  # GET /gateways/1
  # GET /gateways/1.json
  def show
    render json: @gateway
  end

  # POST /gateways
  # POST /gateways.json
  def create
    @gateway = Gateway.new(gateway_params)
    authorize @gateway

    if @gateway.save
      render json: @gateway, status: :created, location: @gateway
    else
      render json: @gateway.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gateways/1
  # PATCH/PUT /gateways/1.json
  def update
    if @gateway.update(gateway_params)
      head :no_content
    else
      render json: @gateway.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gateways/1
  # DELETE /gateways/1.json
  def destroy
    @gateway.destroy

    head :no_content
  end

  private

    def set_gateway
      @gateway = Gateway.find(params[:id])
      authorize @gateway
    end

    def gateway_params
      params.require(:gateway).permit(:email, :password,
                                      :password_confirmation, :authorized)
    end
end
