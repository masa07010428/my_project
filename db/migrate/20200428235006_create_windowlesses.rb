class CreateWindowlesses < ActiveRecord::Migration[5.2]
  def change
    create_table :windowlesses do |t|
      t.string :judgement

      t.timestamps
    end
  end
end
