class User < ApplicationRecord
  has_many :author_tests, class_name: 'Test', inverse_of: 'author', foreign_key: 'author_id'
  has_many :test_takers
  has_many :tests, through: :test_takers
  def find_tests(level)
    Test.joins('JOIN test_takers ON test_id = tests.id').where('level = ? AND test_takers.user_id = ?', level, id)
  end
end
