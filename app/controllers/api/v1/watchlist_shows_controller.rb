class Api::V1::WatchlistShowsController < ApplicationController
	before_action :authenticate_user!

	def index
		render json: { films: ActiveModelSerializers::SerializableResource.new(current_user.watchlist_films, each_serializer: FilmPreviewSerializer),
										seasons: ActiveModelSerializers::SerializableResource.new(current_user.watchlist_seasons, each_serializer: SeasonSerializer),
										episodes: ActiveModelSerializers::SerializableResource.new(current_user.watchlist_episodes, each_serializer: EpisodeSerializer)}
	end
end