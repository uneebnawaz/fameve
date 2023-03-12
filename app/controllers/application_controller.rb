class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	def after_sign_in_path_for(resource)
    if current_user.status == true && current_user.role == 'admin'
      admin_dashboard_path
    elsif current_user.status == true
      seller_dashboard_path
    else
      root_path
    end 
  end

before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :fname, :lname, :address, :phone, :skill, :experience, :education, :role, :certification, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :fname, :lname, :address, :phone, :skill, :experience, :education, :role, :certification, :image])
  end

end
