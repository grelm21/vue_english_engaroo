class Student < ApplicationRecord

  belongs_to :course
  belongs_to :user

  after_initialize ->(student) {student.progress_lesson||= 1}

  def self.add_student(user, course)
    find_or_create_by!(user:, course:)
    user.add_role(:student, course)
  end
end
