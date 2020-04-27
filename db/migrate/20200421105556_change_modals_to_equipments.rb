class ChangeModalsToEquipments < ActiveRecord::Migration[5.2]
  def change
    rename_table :modals, :equipments
  end
end
