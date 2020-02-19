class RemoveCompositeUniqunessIndexInWatchlistShows < ActiveRecord::Migration[5.2]
  def change
  	remove_index :watchlist_shows, [:watchlistable_id, :user_id]
  end
end
