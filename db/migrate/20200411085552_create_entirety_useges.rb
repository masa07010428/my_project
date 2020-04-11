class CreateEntiretyUseges < ActiveRecord::Migration[5.2]
  def change
    create_table :entirety_useges do |t|
      
      t.timestamps
    end
  end
end
