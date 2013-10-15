class RegistrationsController < Devise::RegistrationsController

   before_action :configure_permitted_parameters, if: :devise_controller?

   def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_in){ |u| u.permit(:email, :password) }
     devise_parameter_sanitizer.for(:sign_up){ |u| u.permit(:name, :username, :about,  :email, :password, :password_confirmation, :role)}
     devise_parameter_sanitizer.for(:account_update){ |u| u.permit(:name, :username, :about, :email, :password, :password_confirmation) }
   end

   def user_params 
     params.require(:user).permit(:email, :password, :current_password, :password_confirmation, :role) 
   end
end
