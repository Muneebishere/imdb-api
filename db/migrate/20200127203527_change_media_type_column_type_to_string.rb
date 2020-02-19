class ChangeMediaTypeColumnTypeToString < ActiveRecord::Migration[5.2]
  def change
  	change_column :films, :media_type, :string
  end
end
