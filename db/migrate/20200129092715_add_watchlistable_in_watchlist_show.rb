class AddWatchlistableInWatchlistShow < ActiveRecord::Migration[5.2]
  def change
  	add_reference :watchlist_shows, :watchlistable, polymorphic: true, index: {:name => "index_watchlistable_on_watchlist_show_id"}
  end
end
