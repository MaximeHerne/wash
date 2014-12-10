class ProfilesController < ApplicationController
before_action :set_profile, only: [:edit, :update, :show]

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end

  def show

  end

  def edit
  end

  def update
    @profile.update(profile_params)
    redirect_to profile_path(current_user)
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :address, :phone, :locality, :postal_code)
  end

end
