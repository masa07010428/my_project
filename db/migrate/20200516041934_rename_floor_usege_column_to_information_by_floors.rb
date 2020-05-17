class RenameFloorUsegeColumnToInformationByFloors < ActiveRecord::Migration[5.2]
  def change
    rename_column :information_by_floors, :floor_usege, :entirety_usege_id
  end
end
