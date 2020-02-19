class AddSeasonNumberToSeason < ActiveRecord::Migration[5.2]
  def change
  	add_column :seasons, :number, :integer
  end
end
