class GiftsController < ApplicationController
  def new
    @gift = Gift.new
  end

  def create
    Gift.create(params[:gift])
  end

  def show
    @gift = Gift.find(params[:id])
  end
end
