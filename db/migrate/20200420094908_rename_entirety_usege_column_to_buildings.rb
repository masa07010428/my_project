class RenameEntiretyUsegeColumnToBuildings < ActiveRecord::Migration[5.2]
  def change
    rename_column :buildings, :entirety_usege, :entirety_usege_id
  end
end
