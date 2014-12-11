class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update, :show]
  before_action :check_ownership, only: [:edit, :update]

  def new
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

  def show
  end

  def edit
  end

  def update
    @profile.update(profile_params)
    redirect_to profile_path(@profile)
  end

  private

  def check_ownership
    redirect_to root_path unless Profile.find(params[:id]).user == current_user
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :phone, :address, :postal_code, :locality)
  end

end
