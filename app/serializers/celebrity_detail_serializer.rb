class CelebrityDetailSerializer < ActiveModel::Serializer
	include Rails.application.routes.url_helpers

  attributes :id, :full_name, :birth_date, :biography, :birth_name, :height, :movies, :display_picture, :tv_shows

  def movies
  	movies = []
  	object.films.where(media_type: "Movie").each do |film|
  		movies << MoviePreviewSerializer.new(film).as_json
  	end
  	movies
  end

  def tv_shows
    tv_shows = []
    object.films.where(media_type: "TvShow").each do |film|
      tv_shows << MoviePreviewSerializer.new(film).as_json
    end
    tv_shows
  end

  def display_picture
  	rails_blob_path(object.display_picture, only_path: true) if object.display_picture.attached?
  end
end
