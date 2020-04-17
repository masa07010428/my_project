class AddCategoryToEntiretyUsege < ActiveRecord::Migration[5.2]
  def change
    add_column :entirety_useges, :category, :string
    add_column :entirety_useges, :example, :text
  end
end
