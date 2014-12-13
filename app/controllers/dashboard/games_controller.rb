module Dashboard
  class GamesController < ApplicationController
    expose(:game)
    expose(:categories)
    expose(:games)
    expose(:youtube_session) { YouTubeIt::Client.new(dev_key: YouTubeITConfig.dev_key)}
    expose(:yt_search_result) { youtube_session.videos_by(query: "#{game.title} game trailer", page: 1, per_page: 1)}
    expose(:video) { yt_search_result.videos.first }

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
        redirect_to :back
      else
        render action: 'new'
      end
    end

    def update
      if self.game.update(game_params)
        redirect_to dashboard_games_path, notice: 'Game was successfully updated.'
      else
        render action: 'edit'
      end
    end

    def destroy
      game.destroy
      redirect_to :back, notice: 'Game was successfully deleted.'
    end

      private
      def game_params
        params.require(:game).permit(:title, :description, :disk_condition, :box_conditiond,category_ids: [])
      end
  end
end
