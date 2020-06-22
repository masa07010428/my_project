class AddtBuildingTypeToBuildings < ActiveRecord::Migration[5.2]
  def change
    add_column :buildings, :building_type, :integer
  end
end
