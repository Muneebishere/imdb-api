class EpisodeSerializer < ActiveModel::Serializer
  attributes :id, :number, :season_id, :tv_show_id, :next_id, :prev_id

  has_one :show_detail, serializer: ShowDetailSerializer
  has_many :celebrity_show_roles, each_serializer: CelebrityShowRoleSerializer
  has_many :reviews, each_serializer: ReviewSerializer

  def season_id
  	object.season.id
  end

  def tv_show_id
  	object.season.tv_show.id
  end

  def next_id
  	record = object.season.episodes.where('id > ?', object.id).first
  	record.id if record.present?
  end

  def prev_id
  	record = object.season.episodes.where('id < ?', object.id).last
  	record.id if record.present?
  end
end
