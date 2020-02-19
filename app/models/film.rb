class Film < ApplicationRecord
	self.inheritance_column = 'media_type'

	enum content_rating: [:general_audiences, :parental_guidance , :parents_strongly_cautioned, :restricted,
  											:adults_only]

	has_many :reviews, as: :reviewable, dependent: :destroy
  has_many :watchlist_shows, as: :watchlistable, dependent: :destroy
	has_many :celebrity_show_roles, as: :rolable, dependent: :destroy

	has_many :film_genres, dependent: :destroy
  has_many :genres, through: :film_genres

	has_one :show_detail, as: :detailable, dependent: :destroy

	def self.search_records(query)
		search_text = '%%'
		if query.present?
			query = query.strip
			query = query.downcase
			search_text = '%' + (query.present? ? query.downcase : '') + '%'
		end
		Film.joins(:show_detail).where("lower(show_details.title) LIKE ?", search_text)
	end

	def reviewers_count
		self.reviews.count
	end
end	