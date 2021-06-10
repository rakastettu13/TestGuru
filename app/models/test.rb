class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :answers, through: :questions
  has_many :test_takers, dependent: :destroy
  has_many :users, through: :test_takers

  scope :by_level, ->(levels) { where(level: levels) }
  scope :easy,   -> { by_level(0...2) }
  scope :medium, -> { by_level(2...5) }
  scope :hard,   -> { by_level(5...Float::INFINITY) }
  scope :by_category, ->(category) { joins(:category).where(categories: { title: category }).order(title: :desc) }
  scope :takers_by_level, ->(user, level) { joins(:test_takers).by_level(level).where(test_takers: { user: user }) }

  def self.title_array_by_category(category)
    by_category(category).pluck(:title)
  end
end
