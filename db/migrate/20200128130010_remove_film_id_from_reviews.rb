class RemoveFilmIdFromReviews < ActiveRecord::Migration[5.2]
  def change
  	remove_column :reviews, :film_id
  end
end
