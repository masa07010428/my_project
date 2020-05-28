class RemoveLatitudeFrombuildind < ActiveRecord::Migration[5.2]
  def change
    remove_column :buildings, :latitude, :float
    remove_column :buildings, :longitude, :float
  end
end
