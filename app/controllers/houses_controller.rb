class HousesController < ApplicationController

  def new
    @user = current_user
    @house = House.new
  end

  def create
    @house = House.new(house_params)
    @house.user = current_user
    if @house.save
      Habitant.create(house: @house, user: current_user )
      redirect_to house_path(@house)
    else
      render :new
    end
  end

  def show
    if current_user.house.nil?
      render :new
    else
      @user = current_user
      @house = House.find(params[:id])
    end
    @home = current_user.house.id
    @user = current_user
    @house = House.find(@home)
    @tasks = @house.tasks

  end

  private

  def house_params
    params.require(:house).permit(:name, :user_id)
  end
end
