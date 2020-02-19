class Api::V1::FilmsController < ApplicationController

	def index
		render json: Film.search_records(params[:query]), each_serializer: FilmPreviewSerializer
	end
end