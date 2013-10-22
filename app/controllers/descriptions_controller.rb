	class DescriptionsController < ApplicationController
		before_action :authenticate_user!
			
			def new
				if current_user.description
					redirect_to edit_description_path(current_user.id)
				else
					@description = Description.new
				end
			
			end
			def create
				#Description.create(description_params)
				description = current_user.build_description(description_params)
				description.save
				redirect_to student_path
			end
			def index
			end

			def edit
				@description = current_user.description
			end

			def update
				description = current_user.description.update_attributes(description_params)
				flash[:success] = "You have succesfully updated your info"
				redirect_to student_path
			end



			  private
	    # Using a private method to encapsulate the permissible parameters is
	    # just a good pattern since you'll be able to reuse the same permit
	    # list between create and update. Also, you can specialize this method
	    # with per-user checking of permissible attributes.
	    def description_params
	      params.require(:description).permit(:skills, :looking_for, :my_idea)
	    end
	end
