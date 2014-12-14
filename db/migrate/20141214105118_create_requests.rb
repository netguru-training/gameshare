class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :user_id_from
      t.integer :user_id_to
      t.integer :game_id
      t.datetime :accepted_at
      t.datetime :rejected_at
    end
  end
end
