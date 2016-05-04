class V1::TasksController < ApplicationController
  before_action :set_task, only: [:show, :destroy]
  devise_token_auth_group :member, contains: [:user, :gateway]
  before_action :authenticate_member!, only: [:update, :index]
  before_action :authenticate_user!, except: [:update, :index]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
    TaskPolicy::Scope.new(current_member, Task).resolve

    render json: @tasks
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    render json: @task
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    authorize @task

    if @task.save
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])
    TaskPolicy::Scope.new(current_member, Task).resolve
    if @task.update(task_params)
      head :no_content
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy

    head :no_content
  end

  private

    def set_task
      @task = Task.find(params[:id])
      authorize @task
    end

    def task_params
      params.require(:task).permit(:execute_at, :code, :state, :description, :node_id, :attachable_id, :attachable_type)
    end
end
