module Dashboard
  class TradesController < ApplicationController
    expose(:trades) { user_games }
    expose(:possessions)

    def index
    end

    def send_request
      possession = Possession.find params[:possession_id]

      if possession.present?
        request = Request.new(
          user_id_from: current_user.id,
          user_id_to: possession.user_id,
          game_id: possession.game_id)
        if request.save
          redirect_to dashboard_trades_path, notice: 'Request sent.'
        else
          redirect_to dashboard_trades_path, flash: { error: 'Cannot send a request.' }
        end
      else
         redirect_to dashboard_trades_path, flash: { error: 'Cannot send a request.' }
      end
    end

    private

    def user_games
      wishlist_games_id_list = current_user.wishlist.pluck(:game_id)
      game_collection = Possession.game_collection_items.where(game: wishlist_games_id_list)
    end
  end
end
