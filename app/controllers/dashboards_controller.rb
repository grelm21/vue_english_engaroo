class DashboardsController < ApplicationController
  # before_action :require_no_authentication!
  def index
    @current_user_profile = current_user.profile if user_signed_in?
    @current_user_courses = current_user.courses.limit(5) if user_signed_in?
    @community_courses = Course.all.limit(8)
    @student_current_course = Course.student_courses(current_user.id).first if user_signed_in?
  end
end
