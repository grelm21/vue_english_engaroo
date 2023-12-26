class DashboardsController < ApplicationController
  # before_action :require_no_authentication!
  def index
    @current_user_profile = current_user.profile if user_signed_in?
  end
end
