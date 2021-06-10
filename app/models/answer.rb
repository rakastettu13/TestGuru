class Answer < ApplicationRecord
  belongs_to :question

  scope :correct_true, -> { where(correct: true) }
end
