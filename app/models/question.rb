class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy
  has_many :test_takers, inverse_of: 'current_question', foreign_key: 'current_question_id', dependent: :nullify
  validates :body, presence: true
end
