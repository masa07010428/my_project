class RenameFloorNumberColumnToFloorNumbers < ActiveRecord::Migration[5.2]
  def change
    rename_column :floor_numbers, :floor_number, :floor
  end
end
