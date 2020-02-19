class Api::V1::MoviesController < ApplicationController
	 before_action :sanitize_movie_params, only: [:create]
	 before_action :set_movie, only: [:show]

	def index
		render json: Movie.search_records(params[:query]), each_serializer: MoviePreviewSerializer
	end

	def show
		on_watchlist = user_signed_in? ? current_user.watchlist_films.where(id: @movie.id).present? : false
		render json: { 
			movie: MovieDetailSerializer.new(@movie), 
			on_watchlist: on_watchlist 
		}
	end

	def create
		movie = Movie.new(movie_params)
		if movie.save
			show_detail = movie.build_show_detail(show_detail_params)
			if show_detail.save
				render json: movie, include: :show_detail, status: :created
			else
				render json: show_detail.errors, status: :unprocessable_entity
			end
		else
			render json: movie.errors, status: :unprocessable_entity
		end
	end

	private
		def sanitize_movie_params
	    params[:content_rating] = params[:content_rating].to_i
	    params[:genres] = params[:genres].split(",")
	  end

	  def set_movie
	  	@movie = Movie.find(params[:id])
	  end

		def movie_params
			params.permit(:content_rating, :genres)
		end

		def show_detail_params
			params.permit(:plot, :budget, :duration, :release_date, :title, :poster)
		end
end