class RemoveEntiretyFloorFrombuildings < ActiveRecord::Migration[5.2]
  def change
    remove_column :buildings, :entirety_floor, :integer
  end
end
