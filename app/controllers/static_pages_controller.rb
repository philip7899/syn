class StaticPagesController < ApplicationController
before_action :authenticate_user!, only: [:index]
#before_action :require_school
	
=begin
	def index
		#authorize! :index, :static_pages 

			@users = current_user.other_schools

	end
=end

	def index
    #authorize! :index, :static_pages
    	@users = current_user.other_schools
    	if @users.blank?
        	render :text => 'NOT WORKING', :status => :unauthorized
    	end
	end

	def home
		
	end

	private

=begin
	def require_school
		return
		if !current_user.brown? || !current_user.risd?
			render :text => 'DENIED', :status => :unauthorized
		end
	end
=end
end
