class Test < ApplicationRecord
  def self.title_desc(category)
    Test.joins('JOIN categories ON categories.id = category_id')
        .where('categories.title = ?', category).select(:title).order(title: :desc)
  end
end
