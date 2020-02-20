class Movie < Film
	def name
    show_detail.title if show_detail.present?
  end
end