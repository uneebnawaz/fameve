class Admin::AuthorizeController < ApplicationController
	def index
		@users = User.unscoped.all
	end
	
	def edit
		@user = User.unscoped.find(params[:id])
		@user.update(status: !@user.status)
		redirect_to admin_authorize_path
	end
end
