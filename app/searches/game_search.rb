class GameSearch < Searchlight::Search
  search_on Game.all

  searches :title

  def search_title
    search.where('title ILIKE ?', "%#{title}%")
  end
end
