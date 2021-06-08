class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions
  has_many :answers, through: :questions
  has_many :test_takers
  has_many :users, through: :test_takers

  def self.title_desc(category)
    joins('JOIN categories ON categories.id = category_id')
      .where('categories.title = ?', category).order(title: :desc).pluck(:title)
  end
end
