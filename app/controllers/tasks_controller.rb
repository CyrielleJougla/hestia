class TasksController < ApplicationController

  def show
    @task = Task.find(params[:id])
  end

  def new
    @house = current_user.habitant.house
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @house = current_user.habitant.house
    @task.house = @house
    if @task.save
      redirect_to house_path(@house)
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
    @house = @task.house
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    if @task.status
      @task.user = current_user
      if current_user.profile.score == nil
        current_user.profile.score = @task.points
      else
      current_user.profile.score += @task.points
      end
      current_user.profile.save
    else
      task_owner = @task.user
      task_owner.profile.score -= @task.points
      task_owner.profile.save
      @task.user = nil
    end
     @task.save

      redirect_to house_path(@task.house)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to house_path(@task.house)
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :points, :status, :user_id, :house_id)
  end


end
