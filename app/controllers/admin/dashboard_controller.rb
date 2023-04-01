class Admin::DashboardController < ApplicationController
	def index
		@reviews = Review.all
		@contacts = ContactUs.all
		@users = User.unscoped.all
		
	end
end
