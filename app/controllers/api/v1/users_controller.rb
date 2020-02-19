class Api::V1::UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_show_object, only: [:update_watchlist_shows]

	def watchlist_shows_count
		render json: {count: current_user.watchlist_films.count + current_user.watchlist_seasons.count + current_user.watchlist_episodes.count}
	end

	def watchlist_films_ids
		render json: {watchlist_ids: current_user.watchlist_films.pluck(:id)}
	end

	def watchlist_seasons_ids
		render json: {watchlist_ids: current_user.watchlist_seasons.pluck(:id)}
	end

	def watchlist_episodes_ids
		render json: {watchlist_ids: current_user.watchlist_episodes.pluck(:id)}
	end

	def update_watchlist_shows
		if params[:add]
			if params[:type].humanize == "Film"
				current_user.watchlist_films << @show_object
			elsif params[:type].humanize == "Season"
				current_user.watchlist_seasons << @show_object
			elsif params[:type].humanize == "Episode"
				current_user.watchlist_episodes << @show_object
			end

		elsif params[:remove]
			record = current_user.watchlist_shows.where(watchlistable_type: params[:type].humanize, watchlistable_id: params[:id]).first
			record.destroy! if record.present?
		end

		render json: {}, status: 200
	end

	private
		def set_show_object
			@show_object = Film.find(params[:id]) if params[:type].humanize == "Film"
			@show_object = Season.find(params[:id]) if params[:type].humanize == "Season"
			@show_object = Episode.find(params[:id]) if params[:type].humanize == "Episode"
		end
end