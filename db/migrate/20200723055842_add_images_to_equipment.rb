class AddImagesToEquipment < ActiveRecord::Migration[5.2]
  def change
    add_column :equipment, :image, :string
  end
end
