class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @tasks = Task.order(params[:sort] || :created_at).page(params[:page]).per(params[:per_page] || 10)
    render json: @tasks
  end

  def new
  end

  def create
    # if User.exists?(task_params[:user_id])
      @task = Task.new(task_params)
      if @task.save
        render json: @task, status: :created
      else
        render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
      end
    # else
      # render json: {error: "User not found "}, status: :not_found
    # end

  end

  def index
    @tasks = Task.all
    render json: @tasks
  end

  def show
    render json: @task
  end

  def update
    @task = Task.find_by(id: params[:id]) 
     if @task.nil?
      render json: { error: 'Task not found' }, status: :not_found
    else
      if @task.update(task_params)
        render json: @task, status: :ok
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @task = Task.find_by(id: params[:id]) 
    if @task.nil?
      render json: { error: 'Task not found' }, status: :not_found
     else
      @task.destroy
      head :no_content 
    end
  end
private

def task_params
    params.require(:task).permit(:title, :description, :status, :due_date)
  end
end
