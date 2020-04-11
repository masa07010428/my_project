class ChangeDataItemToEntiretyUseges < ActiveRecord::Migration[5.2]
  def change
    change_column :entirety_useges, :item, :string
  end
end
