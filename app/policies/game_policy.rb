class GamePolicy < ApplicationPolicy
  def add_to_wishlist?
    not has_in_collection?
  end

  def add_to_collection?
    not has_in_wishlist?
  end

  def remove_from_collection?
    has_in_collection?
  end

  def remove_from_wishlist?
    has_in_wishlist?
  end

  private

  def has_in_wishlist?
    WishlistItem.avaliable(user, record)
  end

  def has_in_collection?
    GameCollectionItem.avaliable(user, record)
  end
end