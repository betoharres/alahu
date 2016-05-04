class V1::NodesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_node, only: [:show, :update, :destroy]

  # GET /nodes
  # GET /nodes.json
  def index
    @nodes = Node.all
    authorize @nodes

    render json: @nodes
  end

  # GET /nodes/1
  # GET /nodes/1.json
  def show
    render json: @node
  end

  # POST /nodes
  # POST /nodes.json
  def create
    @node = Node.new(node_params)
    authorize @node

    if @node.save
      render json: @node, status: :created, location: @node
    else
      render json: @node.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /nodes/1
  # PATCH/PUT /nodes/1.json
  def update
    if @node.update(node_params)
      head :no_content
    else
      render json: @node.errors, status: :unprocessable_entity
    end
  end

  # DELETE /nodes/1
  # DELETE /nodes/1.json
  def destroy
    @node.destroy

    head :no_content
  end

  private

    def set_node
      @node = Node.find(params[:id])
      authorize @node
    end

    def node_params
      params.require(:node).permit(:name, :location)
    end
end
