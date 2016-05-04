class V1::ConfigsController < ApplicationController
  before_action :set_config, only: [:update, :destroy]
  devise_token_auth_group :member, contains: [:user, :gateway]
  before_action :authenticate_member!, only: [:show]
  before_action :authenticate_user!, except: [:show]

  # GET /configs
  # GET /configs.json
  def index
    @configs = Config.all
    authorize @configs

    render json: @configs
  end

  # GET /configs/1
  # GET /configs/1.json
  def show
    @config = Config.find(params[:id])
    ConfigPolicy::Scope.new(current_member, Config).resolve
    render json: @config
  end

  # POST /configs
  # POST /configs.json
  def create
    @config = Config.new(config_params)
    authorize @config

    if @config.save
      render json: @config, status: :created, location: @config
    else
      render json: @config.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /configs/1
  # PATCH/PUT /configs/1.json
  def update
    if @config.update(config_params)
      head :no_content
    else
      render json: @config.errors, status: :unprocessable_entity
    end
  end

  # DELETE /configs/1
  # DELETE /configs/1.json
  def destroy
    @config.destroy

    head :no_content
  end

  private

    def set_config
      @config = Config.find(params[:id])
      authorize @config
    end

    def config_params
      params.require(:config).permit(:name, :content)
    end
end
