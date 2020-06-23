class CreateFireUses < ActiveRecord::Migration[5.2]
  def change
    create_table :fire_uses do |t|
      t.string :fire_use_select

      t.timestamps
    end
  end
end
