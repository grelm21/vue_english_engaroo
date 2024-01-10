class CoursePolicy < ApplicationPolicy
  def my_materials?
    user.id === record.id
  end
end