class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: %i[ show edit update destroy ]

  # GET /profiles/1
  def show
    if @profile.nil?
      redirect_to new_profile_path
    end
  end

  # GET /profiles/1/edit
  def edit
  end

  # PATCH/PUT /profiles/1
  def update
    if @profile.update(profile_params)
      redirect_to profile_url(@profile), notice: "Profile was successfully updated."
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params.merge(user_id: current_user.id))
    if @profile.save
      redirect_to profile_url(@profile), notice: "Profile was successfully updated."
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :phone, :address, :city, :postal_code, :image)
    end
end
