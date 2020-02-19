class AddCompositeUniquenessInWatchlistShow < ActiveRecord::Migration[5.2]
  def change
  	add_index :watchlist_shows, [:watchlistable_id, :user_id], unique: true
  end

end