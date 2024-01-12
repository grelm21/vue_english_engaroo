class ClassroomsController < ApplicationController
  before_action :set_course

  def show
    if user_signed_in?
      Student.add_student(current_user, @course_classroom)
    end
  end

  private

  def set_course
    @course_classroom = Course.find(params[:id])
  end
end
