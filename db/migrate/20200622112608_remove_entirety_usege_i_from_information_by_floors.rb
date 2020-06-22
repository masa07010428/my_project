class RemoveEntiretyUsegeIFromInformationByFloors < ActiveRecord::Migration[5.2]
  def change
    remove_column :information_by_floors, :entirety_usege_id, :integer
  end
end
