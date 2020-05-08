class RemoveWindowlessFloorFromBuildings < ActiveRecord::Migration[5.2]
  def change
    remove_column :buildings, :windowless_floor, :integer
  end
end
