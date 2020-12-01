class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @user = current_user
    @task = Task.new
  end

  def create
    @task = Task.new(tasks_params)
    @task.user = current_user
    if @task.save
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  # def edit
  #   @task = Task.find(params[:id])
  # end

  # def update
  #   @task = Task.find(params[:id])
  #   @task.update(task_params)
  #   redirect_to task_path(@task)
  # end

  # def destroy
  #   @task = Task.find(params[:id])
  #   @task.destroy
  #   redirect_to tasks_path
  # end

  private

  def task_params
    params.require(:task).permit(:name, :description, :points, :status, :user_id, :house_id)
  end


end
