class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.integer :user_id
      t.string :name
      t.text :address
      t.integer :entirety_usege
      t.integer :entirety_floor
      t.integer :basement_floor
      t.integer :total_area
      t.integer :total_capacity
      t.integer :windowless_floor
      t.integer :fire_use
      t.timestamps
    end
  end
end

