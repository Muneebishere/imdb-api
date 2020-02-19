class WatchlistShow < ApplicationRecord
  belongs_to :user
  belongs_to :watchlistable, polymorphic: true

  validates :watchlistable_id, uniqueness: { scope: [:user_id, :watchlistable_type] }
end
