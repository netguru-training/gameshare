class Game < ActiveRecord::Base
  enum disk_condition: { poor: 0, good: 1, mint: 2 }
  enum box_condition: {poor: 0, good: 1, mind: 2}

  validates :title, :description, :disk_condition, :box_condition, presence: true
end
