	class InformationsController < ApplicationController

		def new
			@information = Information.new
		end
		def create
			@information = Information.create(params[:information])
			redirect_to student_path
		end
		def index
		end
	end
