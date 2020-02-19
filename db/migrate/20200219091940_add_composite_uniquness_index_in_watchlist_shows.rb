class AddCompositeUniqunessIndexInWatchlistShows < ActiveRecord::Migration[5.2]
  def change
  	add_index :watchlist_shows, [:watchlistable_id, :watchlistable_type, :user_id], unique: true, name: "index_watchlistable_and_user_id"
  end
end
