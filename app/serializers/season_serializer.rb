class SeasonSerializer < ActiveModel::Serializer
  attributes :id, :number, :tv_show_id, :next_id, :prev_id

  has_one :show_detail, serializer: ShowDetailSerializer
  has_many :episodes, each_serializer: EpisodeSerializer
  has_many :celebrity_show_roles, each_serializer: CelebrityShowRoleSerializer
  has_many :reviews, each_serializer: ReviewSerializer

  def tv_show_id
  	object.tv_show.id
  end

  def next_id
  	record = object.tv_show.seasons.where('id > ?', object.id).first
  	record.id if record.present?
  end

  def prev_id
  	record = object.tv_show.seasons.where('id < ?', object.id).last
  	record.id if record.present?
  end
end
