class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    if current_user.profile
      @profile = current_user.profile
    else
      @profile = Profile.create(user: current_user)
    end
  end
end
