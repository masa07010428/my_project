class RenameTypeColumnToBuildingTypes < ActiveRecord::Migration[5.2]
  def change
    rename_column :building_types, :type, :b_type
  end
end
