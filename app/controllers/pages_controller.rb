class PagesController < ApplicationController
  def home
    redirect_to house_path(current_user.house) if current_user.house
  end
end
