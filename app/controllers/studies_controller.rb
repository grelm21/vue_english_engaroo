class StudiesController < ApplicationController
  def index
    @student_courses = Course.student_courses(current_user.id)
  end

  def show
  end

  def destroy
  end
end
