class AddNumberColumnToEpisodes < ActiveRecord::Migration[5.2]
  def change
  	add_column :episodes, :number, :integer
  end
end
