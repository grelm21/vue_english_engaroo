class Course < ApplicationRecord

  resourcify

  belongs_to :user

  has_many :courses_profiles, dependent: :destroy
  has_many :profiles, through: :courses_profiles
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

  private
  def creator_student
    user.add_role(:creator, self)
    user.add_role(:student, self)

    CoursesProfile.create(profile_id: user.profile.id, course_id: self.id)
  end
end
