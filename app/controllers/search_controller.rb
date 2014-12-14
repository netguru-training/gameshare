class SearchController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  expose(:games) { fetch_games }
  expose(:category_id) { params[:search][:category_id].presence }
  expose(:category) { category_id.present? ? Category.find(category_id) : nil }

  def index
  end

  def show
  end

  private

  def fetch_games
    search  = GameSearch.new(search_query || {})
    search.results
  end
end
