class TvShowDetailSerializer < ActiveModel::Serializer
  attributes :id, :content_rating

  has_many :genres
  has_many :celebrity_show_roles, each_serializer: CelebrityShowRoleSerializer
  has_many :reviews, each_serializer: ReviewSerializer
  has_one :show_detail, serializer: ShowDetailSerializer
  has_many :seasons, each_serializer: SeasonSerializer
end
