class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    @task.save
    # No need for app/views/restaurants/create.html.erb
    # raise
    redirect_to task_path(@task)
  end

  def new
    @task = Task.new # Needed to instantiate the form_with
  end

  def update
    @task = Task.find(params[:id])
    @task.update(params[:task]) # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to task_path(@task)
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end

end
