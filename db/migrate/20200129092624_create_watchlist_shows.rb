class CreateWatchlistShows < ActiveRecord::Migration[5.2]
  def change
    create_table :watchlist_shows do |t|
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
