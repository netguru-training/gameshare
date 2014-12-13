class CreatePossessions < ActiveRecord::Migration
  def change
    create_table :possessions do |t|
      t.belongs_to :user
      t.belongs_to :game
      t.string :type

      t.timestamps
    end
  end
end
