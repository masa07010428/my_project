class AddFireUseIdToBuildings < ActiveRecord::Migration[5.2]
  def change
    add_column :buildings, :fire_use_id, :integer
  end
end
