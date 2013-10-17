class StaticPagesController < ApplicationController
before_action :authenticate_user!, only: [:index]
before_action :require_school
	def index
		#authorize! :index, :static_pages 

			@users = current_user.other_schools

	end
	def home
		
	end

	private


	def require_school
		return
		if !current_user.brown? || !current_user.risd?
			render :text => 'DENIED', :status => :unauthorized
		end
	end
end
