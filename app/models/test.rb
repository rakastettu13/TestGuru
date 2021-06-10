class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :answers, through: :questions
  has_many :test_takers, dependent: :destroy
  has_many :users, through: :test_takers

  def self.title_desc(category)
    joins(:category)
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
