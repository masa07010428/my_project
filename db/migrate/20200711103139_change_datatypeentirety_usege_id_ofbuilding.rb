class ChangeDatatypeentiretyUsegeIdOfbuilding < ActiveRecord::Migration[5.2]
  def change
    change_column :buildings, :entirety_usege_id, :integer
  end
end
