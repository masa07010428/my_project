class AddTypeToBuildingTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :building_types, :type, :string
  end
end
