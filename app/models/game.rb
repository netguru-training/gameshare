class Game < ActiveRecord::Base
  enum disk_condition: { poor: 0, good: 1, mint: 2 }
  enum box_condition: { brand_new: 0, used: 1 }

  validates :title, :description, :disk_condition, :box_condition, presence: true

  has_many :possessions
  has_many :users, through: :possessions
  has_and_belongs_to_many :categories

  def owners
    possessions.game_collection_items
  end

  def wishers
    possessions.wishlist_items
  end
end
