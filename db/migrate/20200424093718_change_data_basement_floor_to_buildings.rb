class ChangeDataBasementFloorToBuildings < ActiveRecord::Migration[5.2]
  def change
    change_column :buildings, :basement_floor, :string
    change_column :buildings, :fire_use, :string
  end
end
