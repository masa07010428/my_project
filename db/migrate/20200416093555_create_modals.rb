class CreateModals < ActiveRecord::Migration[5.2]
  def change
    create_table :modals do |t|
      t.string :item
      t.text :introduction

      t.timestamps
    end
  end
end
