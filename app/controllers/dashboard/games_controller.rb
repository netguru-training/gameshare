module Dashboard
  class GamesController < ApplicationController
    expose(:game)
    expose(:categories)
    expose(:games)
    expose(:video) { Youtube.new(game.title).first_video }

    after_action :verify_authorized, except: :index

    def index
    end

    def edit
    end

    def new
    end

    def show
    end

    def create
      self.game = Game.new(game_params)
      if game.save
        redirect_to dashboard_games_path, notice: 'Game was successfully created.'
      else
        render action: 'new'
      end
    end

    def update
      if game.save
        redirect_to dashboard_games_path, notice: 'Game was successfully updated.'
      else
        render action: 'edit'
      end
    end

    def destroy
      if game.destroy
        redirect_to :back, notice: 'Game was successfully deleted.'
      else
        redirect_to :back, error: 'Somethin went wrong.'
      end
    end

    def add_to_wishlist
      add_game = WishlistItem.new(user: current_user, game: game)
      if add_game.save
        redirect_to dashboard_game_path(game), notice: 'Added to wishlist.'
      else
        redirect_to dashboard_game_path(game), flash: { error: 'Cannot add to wishlist.' }
      end
    end

    def add_to_collection
      add_game = GameCollectionItem.new(user: current_user, game: game)
      if add_game.save
        redirect_to dashboard_game_path(game), notice: 'Added to collection.'
      else
        redirect_to dashboard_game_path(game), flash: { error: 'Cannot add to game collection.' }
      end
    end

    protected

    def authorize_user
      authorize game
    end

    private

    def game_params
      params.require(:game).permit(:title, :description, :disk_condition, :box_conditiond, category_ids: [])
    end
  end
end

