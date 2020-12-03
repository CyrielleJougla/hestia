class HabitantsController < ApplicationController

  def new
    @house = House.find(params[:house_id])
    @habitant = Habitant.new
  end

  def create
    @house = House.find(params[:habitant][:house])
    @habitant = Habitant.new(house: @house, user: current_user)
    if @habitant.save
      redirect_to house_path(@house)
    else
      render :new
    end
  end

end




