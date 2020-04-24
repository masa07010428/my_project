class DropTableEquipments < ActiveRecord::Migration[5.2]
  def change
    drop_table :equipments
  end
end
