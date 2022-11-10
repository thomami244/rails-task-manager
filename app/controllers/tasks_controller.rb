class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.save
    redirect_to tasks_path
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end

# class TasksController < ApplicationController
#   def index
#     @tasks = Task.all
#   end

#   def show
#     @task = Task.find(params[:id])
#   end

#   def create
#     @task = Task.new(task_params)
#     @task.save
#     # No need for app/views/restaurants/create.html.erb
#     # raise
#     redirect_to task_path(@task)
#   end

#   def new
#     @task = Task.new # Needed to instantiate the form_with
#   end

#   def update
#     @task = Task.find(params[:id])
#     @task.update(params[:task]) # Will raise ActiveModel::ForbiddenAttributesError
#     redirect_to task_path(@task)
#   end

#   def edit
#     @task = Task.find(params[:id])
#   end

#   private

#   def task_params
#     params.require(:task).permit(:title, :details)
#   end

# end
