class ShowDetailSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  
  attributes :budget, :duration, :title, :release_date, :plot, :poster, :overall_rating

  def poster
  	rails_blob_path(object.poster, only_path: true) if object.poster.attached?
  end
end
