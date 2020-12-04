class PagesController < ApplicationController

  def home
    redirect_to house_path(current_user.habitant.house) if current_user.habitant
    redirect_to new_profile_path unless current_user.profile
  end

end


