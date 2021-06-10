class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  scope :correct_true, -> { where(correct: true) }
end
