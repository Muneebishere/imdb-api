class CelebrityPreviewSerializer < ActiveModel::Serializer
	include Rails.application.routes.url_helpers

  attributes :id, :full_name, :birth_date, :credits, :display_picture, :occupations

  def credits
  	movies = []
  	object.films.count
  end

  def display_picture
  	rails_blob_path(object.display_picture, only_path: true) if object.display_picture.attached?
  end
end
