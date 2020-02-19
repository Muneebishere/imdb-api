class RenameDetailToShowDetail < ActiveRecord::Migration[5.2]
  def change
  	rename_table :details, :show_details
  end
end
