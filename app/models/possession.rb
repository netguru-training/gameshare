class Possession < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  scope :wishlist_items, -> { where type: 'WishlistItem' }
  scope :game_collection_items, -> { where type: 'GameCollectionItem' }
end