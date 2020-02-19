class CelebrityShowRoleSerializer < ActiveModel::Serializer
	include Rails.application.routes.url_helpers

  attributes :id, :role_type, :character_name, :celebrity, :celebrity_display_picture

  def celebrity_display_picture
  	rails_blob_path(object.celebrity.display_picture, only_path: true) if object.celebrity.display_picture.attached?
  end
end
