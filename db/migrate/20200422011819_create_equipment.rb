class CreateEquipment < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment do |t|
      t.string :item
      t.text :introduction
      t.timestamps
    end
  end
end
