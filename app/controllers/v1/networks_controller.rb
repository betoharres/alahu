class V1::NetworksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_network, only: [:show, :update, :destroy]

  # GET /networks
  # GET /networks.json
  def index
    @networks = Network.all
    authorize @networks

    render json: @networks
  end

  # GET /networks/1
  # GET /networks/1.json
  def show
    render json: @network
  end

  # POST /networks
  # POST /networks.json
  def create
    @network = Network.new(network_params)
    authorize @network

    if @network.save
      render json: @network, status: :created, location: @network
    else
      render json: @network.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /networks/1
  # PATCH/PUT /networks/1.json
  def update
    if @network.update(network_params)
      head :no_content
    else
      render json: @network.errors, status: :unprocessable_entity
    end
  end

  # DELETE /networks/1
  # DELETE /networks/1.json
  def destroy
    @network.destroy

    head :no_content
  end

  private

    def set_network
      @network = Network.find(params[:id])
      authorize @network
    end

    def network_params
      params.require(:network).permit(:name)
    end
end
