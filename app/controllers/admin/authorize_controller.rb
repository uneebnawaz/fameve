class Admin::AuthorizeController < ApplicationController
	def index
		@users = User.unscoped.all
	end
	
	def edit
		user = User.unscoped.find(params[:id])
		user.update(status: !user.status)
	end
end
