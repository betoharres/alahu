class V1::LampStatsController < ApplicationController
  before_action :authenticate_gateway!, only:   [:create]
  before_action :authenticate_user!,    except: [:create]
  before_action :set_lamp_stat,         only: [:show, :update, :destroy]

  # GET /lamp_stats
  # GET /lamp_stats.json
  def index
    @lamp_stats = LampStat.all
    authorize @lamp_stats

    render json: @lamp_stats
  end

  # GET /lamp_stats/1
  # GET /lamp_stats/1.json
  def show
    render json: @lamp_stat
  end

  # POST /lamp_stats
  # POST /lamp_stats.json
  def create
    @lamp_stat = LampStat.new(lamp_stat_params)
    LampStatPolicy::Scope.new(current_gateway, LampStat).resolve

    if @lamp_stat.save
      render json: @lamp_stat, status: :created, location: @lamp_stat
    else
      render json: @lamp_stat.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lamp_stats/1
  # PATCH/PUT /lamp_stats/1.json
  def update
    if @lamp_stat.update(lamp_stat_params)
      head :no_content
    else
      render json: @lamp_stat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lamp_stats/1
  # DELETE /lamp_stats/1.json
  def destroy
    @lamp_stat.destroy

    head :no_content
  end

  private

    def set_lamp_stat
      @lamp_stat = LampStat.find(params[:id])
      authorize @lamp_stat
    end

    def lamp_stat_params
      params.require(:lamp_stat).permit(:serial_number, :date, :power, :current, :volt, :tCom, :tLed1, :tLed2, :sLum, :rssiDev, :lqiDev, :correlationDev, :rssi, :lqi, :correlation, :sentPkts, :rcvPkts, :lastReboot, :txPwr, :ctrlRestart, :vFirmware, :vCmd, :cksCfg, :appCksErr, :cmdNotImp, :online, :communicating, :sunrise, :sunset)
    end
end
