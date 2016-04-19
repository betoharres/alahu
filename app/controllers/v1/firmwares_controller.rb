class V1::FirmwaresController < ApplicationController

  before_action :set_firmware, only: [:show, :update, :destroy]

  devise_token_auth_group :member, contains: [:user, :gateway]
  before_action :authenticate_member!

  # GET /firmwares
  # GET /firmwares.json
  def index
    @firmwares = Firmware.all

    render json: @firmwares
  end

  # GET /firmwares/1
  # GET /firmwares/1.json
  def show
    render json: @firmware
  end

  # POST /firmwares
  # POST /firmwares.json
  def create
    @firmware = Firmware.new(firmware_params)

    if @firmware.save
      render json: @firmware, status: :created, location: @firmware
    else
      render json: @firmware.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /firmwares/1
  # PATCH/PUT /firmwares/1.json
  def update
    @firmware = Firmware.find(params[:id])

    if @firmware.update(firmware_params)
      head :no_content
    else
      render json: @firmware.errors, status: :unprocessable_entity
    end
  end

  # DELETE /firmwares/1
  # DELETE /firmwares/1.json
  def destroy
    @firmware.destroy

    head :no_content
  end

  private

    def set_firmware
      @firmware = Firmware.find(params[:id])
    end

    def firmware_params
      params.require(:firmware).permit(:name, :path)
    end
end