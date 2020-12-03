class PagesController < ApplicationController

  def home
    redirect_to house_path(current_user.house) if current_user.house
    redirect_to new_profile_path unless current_user.profile
  end

end


