class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate  :validate_count, on: :create

  scope :correct, -> { where(correct: true) }

  def validate_count
    errors.add(:question) if question.answers.count >= 4
  end
end
