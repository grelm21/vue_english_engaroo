class Lesson < ApplicationRecord
  belongs_to :course
  before_create :set_order
  after_create :set_demo

  has_many :tasks, dependent: :destroy

  # scope :last_lessons_preview, ->(course) { where(course: course).order(order: :desc).limit(4) }
  scope :last_lessons_preview, -> { order(order: :desc).limit(4) }

  private

  def set_order
    if self.course.lessons.all.blank?
      self.order = 1
    else
      count = self.course.lessons.order(order: :desc).first.order
      self.order = count + 1
    end
  end

  def set_demo
    self.demo = true
  end
end
