class Matching < ApplicationRecord
  belongs_to :task

  validates :first_word, presence: true
  validates :second_word, presence: true

end
