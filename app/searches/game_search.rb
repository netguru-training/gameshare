class GameSearch < Searchlight::Search
  search_on Game.all

  searches :title, :category_id, :disk_condition, :box_condition

  def search_title
    search.where('title ILIKE ?', "%#{title}%")
  end

  def search_category_id
    search.joins(:categories).where(categories: { id: category_id })
  end

  def search_disk_condition
    search.where(disk_condition: disk_condition)
  end

  def box_condition
    search.where(box_condition: box_condition.map(&:i))
  end
end
