class TasksController < ApplicationController
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
    task_status
    redirect_to house_path(@task.house)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to house_path(@task.house)
  end

  private

  def task_status
    # SI @task.status = true ==> faite !
    if @task.status
      if @task.user != current_user
        @task.user = current_user

        if current_user.profile.score == nil
          current_user.profile.score = @task.points
        else
          current_user.profile.score += @task.points
        end
        current_user.profile.save
      end
    # SINON @task.status = false ==> pas faite !
    else
      if @task.user != nil
        task_owner = @task.user
        task_owner.profile.score -= @task.points if task_owner.profile.score > 0
        task_owner.profile.save
        @task.user = nil
      end
    end
      @task.save
  end

  def task_params
    params.require(:task).permit(:name, :description, :points, :status, :user_id, :house_id)
  end
end
