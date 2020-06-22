class RemoveBasementFloorFrombuildings < ActiveRecord::Migration[5.2]
  def change
    remove_column :buildings, :basement_floor, :integer
    remove_column :buildings, :total_area, :integer
    remove_column :buildings, :total_capacity, :integer
    remove_column :buildings, :fire_use, :integer
  end
end
