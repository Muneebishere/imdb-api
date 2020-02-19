class User < ActiveRecord::Base	
  extend Devise::Models

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include DeviseTokenAuth::Concerns::User

  has_one_attached :avatar

  has_many :watchlist_shows, dependent: :destroy
  has_many :watchlist_films, through: :watchlist_shows, source: :watchlistable, source_type: :Film, dependent: :destroy
  has_many :watchlist_seasons, through: :watchlist_shows, source: :watchlistable, source_type: :Season, dependent: :destroy
  has_many :watchlist_episodes, through: :watchlist_shows, source: :watchlistable, source_type: :Episode, dependent: :destroy
  has_many :reviews, dependent: :destroy

  def name
    uid
  end
end
