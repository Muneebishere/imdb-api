class TvShow < Film
	has_many :seasons, foreign_key: :film_id
	
	def name
    show_detail.title if show_detail.present?
  end
end