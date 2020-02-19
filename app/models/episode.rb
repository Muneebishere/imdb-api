class Episode < ApplicationRecord
  belongs_to :season

  has_many :celebrity_show_roles, as: :rolable, dependent: :destroy
  has_many :reviews, as: :reviewable
  has_many :watchlist_shows, as: :watchlistable

  has_one :show_detail, as: :detailable

  validates :number, presence: true

  def name
    season.tv_show.show_detail.title + ":Season" + season.number.to_s + ":Episode" + number.to_s if season.present?
  end
end
