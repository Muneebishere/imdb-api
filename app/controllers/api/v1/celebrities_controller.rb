class Api::V1::CelebritiesController < ApplicationController
	before_action :set_celebrity, only: [:show]

	def index
		render json: Celebrity.search_records(params[:query]), each_serializer: CelebrityPreviewSerializer
	end

	def show
		render json: @celebrity, serializer: CelebrityDetailSerializer
	end

	private

		def set_celebrity
			@celebrity = Celebrity.find(params[:id])
		end
end