class TvShowSerializer < ActiveModel::Serializer
  attributes :id
  has_one :show_detail, serializer: ShowDetailSerializer
end
