class TasksController < ApplicationController
def index
    @tasks = Task.all
    @tasks = Task.paginate(page: params[:page], per_page: 2)
  end
  def new

  end
  def create
    @task = Task.new(task_params)
    if @task.save
      render json: @task, status: :created
    else
      render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # GET /tasks
  def index
    @tasks = Task.all
    render json: @tasks
  end

  # GET /tasks/:id
  def show
    render json: @task
  end

  # PATCH /tasks/:id
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/:id
  def destroy
    @task.destroy
    head :no_content
  end
private
def task_params
    params.require(:task).permit(:title, :description, :status, :due_date)
  end
end
