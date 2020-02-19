class MovieDetailSerializer < ActiveModel::Serializer
  attributes :id, :content_rating

  has_many :genres
  has_one :show_detail, serializer: ShowDetailSerializer  
  has_many :celebrity_show_roles, each_serializer: CelebrityShowRoleSerializer
  has_many :reviews, each_serializer: ReviewSerializer
end
