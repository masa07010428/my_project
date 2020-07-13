class CreateFloorNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :floor_numbers do |t|
      t.string :floor_number

      t.timestamps
    end
  end
end
