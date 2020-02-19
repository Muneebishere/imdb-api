class Season < ApplicationRecord
  belongs_to :tv_show, foreign_key: :film_id

  has_many :episodes, dependent: :destroy
  has_many :celebrity_show_roles, as: :rolable, dependent: :destroy
  has_many :reviews, as: :reviewable
  has_many :watchlist_shows, as: :watchlistable

  has_one :show_detail, as: :detailable

  validates :number, presence: true

  def name
    tv_show.show_detail.title + ":Season" + number.to_s if tv_show.present?
  end
end
