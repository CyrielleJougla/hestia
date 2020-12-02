class HousesController < ApplicationController
  # before_action :initialize_house, only: [:new, :create]

  # def initialize_house
  #   @house = House.new
  # end

  def new
    @user = current_user
    @house = House.new
  end

  def create
    @house = House.new(house_params)
    @house.user = current_user
    if @house.save!
      redirect_to house_path(@house)
    else
      render :new
    end
  end

  def show
    # @user = current_user
    # @house = House.find(params[:id])

    # if current_user.house.nil?
    #   render :new
    # else
    #   @user = current_user
    #   @house = House.find(params[:id])
    # end

    if current_user.house.nil?
      render :new
    else
      @home = current_user.house.id
      @user = current_user
      @house = House.find(@home)
    end
  end

  private

  def house_params
    params.require(:house).permit(:name, :user_id)
  end
end
