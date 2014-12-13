class SearchController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  expose(:games) { search_query.try(:[], :title).present? ? fetch_games : [] }

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
