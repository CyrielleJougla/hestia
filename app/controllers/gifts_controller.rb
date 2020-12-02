class GiftsController < ApplicationController
  def new
    @house = current_user.house
    @gift = Gift.new
  end

  def create
    @gift = Gift.new(gift_params)
    @house = current_user.house
    @gift.house = @house
    if @gift.save
      redirect_to house_gift_path
    else
      render :new
    end
  end

  def show
    @gift = Gift.find(params[:id])
  end

  def gift_params
    params.require(:gift).permit(:name, :house_id, :description)
  end
end

