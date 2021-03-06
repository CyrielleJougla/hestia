class GiftsController < ApplicationController
  def new
    @house = current_user.habitant.house
    @gift = Gift.new
  end

  def create
    @gift = Gift.new(gift_params)
    @house = current_user.habitant.house
    @gift.house = @house
    if @gift.save!
      redirect_to gift_path(@gift)
    else
      render :new
    end
  end

  def show
    # @house = current_user.habitant.house
    # @gift = Gift.find(params[:id])

    if current_user.habitant.house.gift.nil?
      render :new
    else
      @house = current_user.habitant.house
      @gift = Gift.find(params[:id])
    end
  end

  def edit
    @gift = Gift.find(params[:id])
    @house = @gift.house
  end

  def update
    @gift = Gift.find(params[:id])
    @gift.update(gift_params)
    redirect_to gift_path(@gift)
  end

  def gift_params
    params.require(:gift).permit(:name, :house_id, :description)
  end
end

