class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:top, :about]
  add_flash_types :success



  #def after_sign_up_path_for(resource)
    #user_path(resource)
  #end

  def after_sign_in_path_for(resource)
    user_path(resource)
  end



  #def after_sign_out_path_for(current_user)
   # redirect_to root_path, success: "Signed out successfully."
  # end


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end

end
