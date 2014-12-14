class DashboardController < ApplicationController
  expose(:wished_games) { current_user.wishlist.map(&:game) }
  expose(:owned_games) { current_user.game_collection.map(&:game) }

  def wishlist
  end

  def game_collection
  end
end
