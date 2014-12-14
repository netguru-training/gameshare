class GamePolicy < ApplicationPolicy
  def add_to_wishlist?
    true
  end

  def add_to_collection?
    true
  end
end