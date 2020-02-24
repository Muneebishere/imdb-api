class Api::V1::EpisodesController < ApplicationController
	before_action :set_episode, only: [:show]

	def show
		on_watchlist = user_signed_in? ? current_user.watchlist_episodes.where(id: @episode.id).present? : false
		render json: { 
			episode: EpisodeSerializer.new(@episode, current_user), 
			on_watchlist: on_watchlist 
		}
	end

	private
		def set_episode
			@episode = TvShow.find(params[:tv_show_id]).seasons.find(params[:season_id]).episodes.find(params[:id])
		end
end