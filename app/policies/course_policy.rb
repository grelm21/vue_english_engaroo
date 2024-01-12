# frozen_string_literal: true

class CoursePolicy < ApplicationPolicy

  # def new?
  #   user.has_role? :admin || :teacher
  # end

  def destroy?
    user.has_role?(:creator, record)
  end

  def my_materials?
    user.has_role? :admin || :teacher
  end
end