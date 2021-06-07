class Test < ApplicationRecord
  def self.title_desc(category)
    joins('JOIN categories ON categories.id = category_id')
      .where('categories.title = ?', category).order(title: :desc).pluck(:title)
  end
end
