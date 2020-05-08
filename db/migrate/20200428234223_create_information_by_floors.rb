class CreateInformationByFloors < ActiveRecord::Migration[5.2]
  def change
    create_table :information_by_floors do |t|
      t.integer :building_id
      t.integer :floor_number
      t.string :floor_usege
      t.integer :floor_area
      t.integer :floor_capacity
      t.integer :windowless_judgement

      t.timestamps
    end
  end
end
