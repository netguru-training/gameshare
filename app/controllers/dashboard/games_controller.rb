module Dashboard
  class GamesController < ApplicationController
    expose(:game)
    expose(:games)

    def index
    end

    def edit
    end

    def new
    end

    def create
      self.game = Game.new(game_params)
      if game.save
        redirect_to dashboard_games_path
      else
        render action: 'new'
      end
    end

    def update
      if self.game.update(game_params)
        redirect_to :back, notice: 'Product was successfully updated.'
      else
        render action: 'edit'
      end
    end

      private
      def game_params
        params.require(:game).permit(:title, :description, :disk_condition, :box_conditiond)
      end
  end
end
