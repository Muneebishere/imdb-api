class UserSerializer < ActiveModel::Serializer
	include Rails.application.routes.url_helpers

  attributes :id, :nickname, :first_name, :last_name, :avatar, :email, :watchlist_shows_count, :reviews_count

  def avatar
  	rails_blob_path(object.avatar, only_path: true) if object.avatar.attached?
  end

  def watchlist_shows_count
  	object.watchlist_shows.count
  end

  def reviews_count
  	object.reviews.count
  end
end
