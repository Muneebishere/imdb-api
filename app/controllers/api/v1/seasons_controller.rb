class Api::V1::SeasonsController < ApplicationController
	before_action :set_season, only: [:show]

	def show
		on_watchlist = user_signed_in? ? current_user.watchlist_seasons.where(id: @season.id).present? : false
		render json: { 
			season: SeasonSerializer.new(@season), 
			on_watchlist: on_watchlist 
		}
	end

	private
		def set_season
			@season = TvShow.find(params[:tv_show_id]).seasons.find(params[:id])
		end
end