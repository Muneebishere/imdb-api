class MoveColumnContentRatingToFilmTable < ActiveRecord::Migration[5.2]
  def change
  	remove_column :show_details, :content_rating
  	add_column :films, :content_rating, :integer
  end
end
