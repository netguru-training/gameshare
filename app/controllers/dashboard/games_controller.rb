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
      self.game = game.create(game_params)
    end

      private
      def game_params
        params.require(:game).permit(:title, :description, :disk_condition, :box_conditiond)
      end
  end
end
