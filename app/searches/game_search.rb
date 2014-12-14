class GameSearch < Searchlight::Search
  search_on Game.all

  searches :title, :category_id

  def search_title
    search.where('title ILIKE ?', "%#{title}%")
  end

  def search_category_id
    search.joins(:categories).where(categories: { id: category_id })
  end
end
