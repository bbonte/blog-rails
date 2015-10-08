class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
    @profile.user = User.new
  end

  # GET /profiles/1/edit
  def edit
    if current_user.profile != @profile
      redirect_to root_path, alert: 'You are not authorized to edit this post.'
    end
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      redirect_to root_path, notice: 'Profile was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    if current_user.profile == @profile
      if @profile.update(profile_params)
        redirect_to @profile, notice: 'Profile was successfully updated.'
      else
        render :edit
      end
    else
      redirect_to root_path
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    if current_user.profile == @profile
      @profile.destroy
      redirect_to root_path, notice: 'Profile was successfully destroyed.'
    else
      redirect_to root_path, alert: 'You are not authorized to delete this profile.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:name, :birthdate, :avatar, user_attributes: [:email, :password, :password_confirmation])
    end
end
