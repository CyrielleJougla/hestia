class PagesController < ApplicationController


  def home
    if current_user.habitant
      @house = current_user.habitant.house
    end
  end

end


