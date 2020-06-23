class BasementByFloors < ActiveRecord::Migration[5.2]
  def change
    drop_table :information_by_basement_floors
  end
end
