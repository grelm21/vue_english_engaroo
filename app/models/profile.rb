class Profile < ApplicationRecord
  belongs_to :user

  # has_many :courses_profiles, dependent: :destroy
  # has_many :courses, through: :courses_profiles

  validates :first_name, presence: true
end
