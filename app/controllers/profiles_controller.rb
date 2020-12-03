class ProfilesController < ApplicationController

  def show
    if current_user.profile
      @profile = Profile.find_by(user_id: params[:id])
    else
      redirect_to new_profile_path
    end
  end

  def new
    @user = current_user
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(profile_params)
    redirect_to profile_path(@profile)
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :nickname, :description, :picture, :user_id)
  end

end
