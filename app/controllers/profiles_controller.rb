class ProfilesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_profile, only: %i[ show edit update destroy ]
  before_action :get_user

  # # GET /profiles or /profiles.json
  # def index
  #   @profiles = Profile.all
  # end

  # GET /profiles/1 or /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = @user.build_profile
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles or /profiles.json
  def create
    @profile = @user.build_profile(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to my_profile_path, notice: "Profile was successfully created." }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1 or /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to my_profile_url, notice: "Profile was successfully updated." }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1 or /profiles/1.json
  def destroy
    @profile.destroy!

    respond_to do |format|
      format.html { redirect_to profiles_url, notice: "Profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def my_profile
    @profile = current_user.profile
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_profile
    @profile = Profile.find(params[:id])
  end

  def get_user
    @user = current_user
  end

  # Only allow a list of trusted parameters through.
  def profile_params
    params.require(:profile).permit(:login, :first_name, :last_name, :bio)
  end
end
