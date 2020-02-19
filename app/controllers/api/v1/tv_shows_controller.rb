class Api::V1::TvShowsController < ApplicationController
	before_action :set_tv_show, only: [:show]

	def show
		on_watchlist = user_signed_in? ? current_user.watchlist_films.where(id: @tvShow.id).present? : false
		render json: { 
			tv_show: TvShowDetailSerializer.new(@tvShow), 
			on_watchlist: on_watchlist 
		}
	end

	private
		def set_tv_show
			@tvShow = TvShow.find(params[:id])
		end
end