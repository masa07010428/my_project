class CreateBuildingTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :building_types do |t|

      t.timestamps
    end
  end
end
