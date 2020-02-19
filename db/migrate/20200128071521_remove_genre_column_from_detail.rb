class RemoveGenreColumnFromDetail < ActiveRecord::Migration[5.2]
  def change
  	remove_column :details, :genre, :string
  end
end
