class FilmPreviewSerializer < ActiveModel::Serializer
  attributes :id, :media_type, :movie, :tv_show

  def movie
  	MoviePreviewSerializer.new(object).as_json if object.media_type == "Movie"
  end

  def tv_show
  	TvShowSerializer.new(object).as_json if object.media_type == "TvShow"
  end

end
