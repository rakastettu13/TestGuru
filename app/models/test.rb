class Test < ApplicationRecord
  def self.title_desc(category)
    category_id = Category.where(title: category)
    Test.where(category_id: category_id).select(:title).order(title: :desc)
  end
end
