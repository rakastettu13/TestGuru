class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validate  :validate_answers_count

  def validate_answers_count
    errors.add(:answers_count) if (1...5).exclude?(answers.count)
  end
end
