class V1::CompaniesController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized, except: [:index, :create]
  before_action :set_company, only: [:show, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
    @companies = current_user.companies

    render json: @companies
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    authorize @company
    render json: @company
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    if @company.save
      UserCompany.create! user: current_user, company: @company, accepted: true
      render json: @company, status: :created, location: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    authorize @company
    if @company.update(company_params)
      head :no_content
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    authorize @company
    @company.destroy

    head :no_content
  end

  private

    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name, :subdomain)
    end
end
