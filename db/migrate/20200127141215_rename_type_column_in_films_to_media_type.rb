class RenameTypeColumnInFilmsToMediaType < ActiveRecord::Migration[5.2]
  def change
  	rename_column :films, :type, :media_type
  end
end
