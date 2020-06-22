class RenameBildingTypeColumnToBuildings < ActiveRecord::Migration[5.2]
  def change
    rename_column :buildings, :building_type, :building_type_id
  end
end
