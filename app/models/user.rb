class User < ApplicationRecord
  has_many :author_tests, class_name: 'Test', inverse_of: 'author', foreign_key: 'author_id', dependent: :destroy
  has_many :test_takers, dependent: :destroy
  has_many :tests, through: :test_takers

  has_secure_password

  def tests_by_level(level)
    Test.takers_by_level(self, level)
  end

  def test_taker(test)
    test_takers.order(id: :desc).find_by(test_id: test.id)
  end
end
