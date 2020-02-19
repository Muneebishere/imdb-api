class Review < ApplicationRecord
	belongs_to :user
	belongs_to :reviewable, polymorphic: true

	validates :reviewable, :user, presence: true
	validates :rating, presence: true, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 10.0 }
	validates :body, length: { minimum: 15 }, allow_blank: true

	before_create :update_overall_rating

	def update_overall_rating
		film = self.film
		count = film.reviewers_count
		total_rating = (film.show_detail.overall_rating * count) + self.rating
		film.show_detail.update(overall_rating: (total_rating/(count + 1)).round(1))
	end

	def body_exists?
		body.present?
	end

	def name
    heading
  end
end
