class ProfilesController < ApplicationController

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @user = current_user
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
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
    redirect_to "/dashboard"
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    redirect_to root_path
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :nickname, :description, :picture, :user_id)
  end

end
