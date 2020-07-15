class RenameFloorNumberColumnToInformationByFloors < ActiveRecord::Migration[5.2]
  def change
    rename_column :information_by_floors, :floor_number, :floor_number_id
  end
end
