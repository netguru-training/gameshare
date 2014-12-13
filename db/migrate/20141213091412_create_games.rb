class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.text :description
      t.integer :disk_condition, default: 0
      t.integer :box_condition, default: 0

      t.timestamps
    end
  end
end
