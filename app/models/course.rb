class Course < ApplicationRecord

  resourcify

  belongs_to :user

  has_many :students, dependent: :destroy
  has_many :lessons, dependent: :destroy

  after_create :creator_student

  enum :language, %i[
  english
  russian
  japanese
  chinese
  ], default: :english

  enum :status, %i[
    unverified
    verified
    banned
  ], default: :unverified

  enum :availability, %i[
  open
  personal
  ], default: :public

  scope :student_courses, ->(user_id) {includes(:students => :user).where(students: {user_id: user_id})}

  private
  def creator_student
    user.add_role(:creator, self)
    Student.add_student(user, self)
  end
end
