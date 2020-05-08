class CreateInformationByBasementFloors < ActiveRecord::Migration[5.2]
  def change
    create_table :information_by_basement_floors do |t|
      t.integer :building_id
      t.string :floor_number
      t.string :floor_usege
      t.integer :floor_area
      t.integer :floor_capacity

      t.timestamps
    end
  end
end
