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
    @habitant = Habitant.find_by(user_id: current_user.id)
    render :new if @habitant.house.nil?
    @user = current_user
    @house = House.find(params[:id])
    @tasks = @house.tasks
    console
  end

  private

  def house_params
    params.require(:house).permit(:name, :user_id)
  end
end
