class TasksController < ApplicationController
  def show_done
    @house = current_user.habitant.house
    @tasks_to_do = @house.tasks.select{ |task| task.status == true}
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @house = current_user.habitant.house
    @task = Task.new
    @task_names = [
      "Sortir les poubelles",
      "Sortir le chien",
      "Changer la litière",
      "Lancer la lessive",
      "Etendre la lessive",
      "Passer l'aspirateur",
      "Faire le lit",
      "Faire le repassage"
    ]
    @members = []
    if current_user.habitant
      current_user.habitant.house.habitants.each do |habitant|
        @members << habitant.user.profile
      end
    end
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
    if params[:task].nil?
      @task.update(status: true)
    else
      @task.update(task_params)
    end
    task_status
    redirect_to house_path(@task.house)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to house_path(@task.house)
  end

  def mark_as_done
    @task = Task.find(params[:task_id])
    status = params[:status] != "true"
    puts status
    @task.status = status
    p @task
    if @task.save
      task_status
      render json: {message: 'success', status: @task.status }.to_json
    else
      render json: {message: 'failure'}.to_json
    end
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
      else
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
        task_owner.profile.score -= @task.points if task_owner.profile.score > 0 unless task_owner.profile.score.nil?

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
