class AddItemToEntiretyUseges < ActiveRecord::Migration[5.2]
  def change
    add_column :entirety_useges, :item, :integer
  end
end
