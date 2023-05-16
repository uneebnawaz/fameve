class ApplicationController < ActionController::Base
	before_action :authenticate_user!
  before_action :check_user_role

	def after_sign_in_path_for(resource)
    if current_user.status == true && current_user.role == 'admin'
      admin_dashboard_path
    elsif current_user.status == true && current_user.role == 'seller'
      seller_dashboard_path
    elsif current_user.status == true && current_user.role == 'advisor'
      advisor_dashboard_path
    else
      root_path
    end 
  end

  private

  def check_user_role
    if request.path.start_with?("/admin") && !current_user.admin?
      if current_user.role == 'seller'
        redirect_to seller_dashboard_path
      elsif current_user.role == 'advisor'
        redirect_to advisor_dashboard_path
      else
        root_path
      end

    elsif request.path.start_with?("/seller") && !current_user.seller?
      if current_user.role == 'admin'
        redirect_to admin_dashboard_path
      elsif current_user.role == 'advisor'
        redirect_to advisor_dashboard_path
      else
        root_path
      end

    elsif request.path.start_with?("/advisor") && !current_user.advisor?
      if current_user.role == 'admin'
        redirect_to admin_dashboard_path
      elsif current_user.role == 'seller'
        redirect_to seller_dashboard_path
      else
        root_path
      end
    end
  end

before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:city, :fname, :lname, :address, :phone, :skill, :experience, :education, :role, :certification, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:city, :fname, :lname, :address, :phone, :skill, :experience, :education, :role, :certification, :image])
  end

end
