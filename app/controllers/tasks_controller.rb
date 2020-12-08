class TasksController < ApplicationController
  def show
    @task = Task.find(params[:id])
  end

  def new
    @house = current_user.habitant.house
    @task = Task.new
    @variable = {
      poubelles: {
        name: "Sortir les poubelles",
        description: "Avant qu'elles ne puent !",
        points: 10
      },
      chien: {
        name: "Sortir le chien - 5 points",
        description: "Faire une balade avec chien-chien d'amour",
        points: 5
      },
      litiere: {
        name: "Changer la litière",
        description: "Courage ! Le chachou sera content !",
        points: 10
      },
      lessive: {
        name: "Lancer la lessive",
        description: "Bien trier les couleurs !",
        points: 5
      },
      etendre: {
        name: "Etendre la lessive",
        description: "Bien au soleil",
        points: 10
      },
      aspirateur: {
        name: "Passer l'aspirateur",
        description: "Passer l'aspirateur dans toutes les pièces",
        points: 15
      },
      lit: {
        name: "Faire le lit",
        description: "Ne pas juste ramener la couette pour faire genre...",
        points: 5
      },
      repassage: {
        name: "Faire le repassage",
        description: "Tiens le coup, ça va aller",
        points: 30
      }
    }
    @task_names = []
    @variable.each do |k, v|
      @task_names << v[:name]
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
