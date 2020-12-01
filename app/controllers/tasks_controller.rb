class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @house = current_user.house
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @house = current_user.house
    @task.house = @house
    if @task.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

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
