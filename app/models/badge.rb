class Badge < ApplicationRecord
  has_many :badge_owners, dependent: :destroy
  has_many :users, through: :badge_owners

  validates :title, presence: true, uniqueness: true
  validates :rule, presence: true
  validates :image_url, presence: true
end
