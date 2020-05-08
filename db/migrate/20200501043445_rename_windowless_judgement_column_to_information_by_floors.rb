class RenameWindowlessJudgementColumnToInformationByFloors < ActiveRecord::Migration[5.2]
  def change
    rename_column :information_by_floors, :windowless_judgement, :windowless_id  
  end
end
