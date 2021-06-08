class User < ApplicationRecord
  has_many :author_tests, class_name: 'Test', inverse_of: 'author', foreign_key: 'author_id', dependent: :destroy
  has_many :test_takers, dependent: :destroy
  has_many :tests, through: :test_takers

  def find_tests(level)
    Test.joins(:test_takers)
        .where({ level: level, test_takers: { user: self } })
  end
end
