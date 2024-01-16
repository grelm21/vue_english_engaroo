class Task < ApplicationRecord

  belongs_to :lesson
  has_many :matchings, dependent: :destroy

  before_create :set_order

  enum :task_type, %i[ matching gap_fill ]

  def set_order
    if self.lesson.tasks.all.blank?
      self.order = 1
    else
      count = self.lesson.tasks.order(order: :desc).first.order
      self.order = count + 1
    end
  end
end
