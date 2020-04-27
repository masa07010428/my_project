class RemoveItemFromEntiretyUsege < ActiveRecord::Migration[5.2]
  def change
    remove_column :entirety_useges, :item, :string
  end
end
