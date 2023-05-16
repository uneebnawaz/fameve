class Seller::ProfileController < ApplicationController
	def index
		
	end

	def add_location
		
	end

	def update_location
		latitude = params[:latitude]
  		longitude = params[:longitude]
  		address = params[:input]
  		user_id = current_user.id
  		@user = User.find(user_id)
    	@user.update(latitude: latitude, longitude: longitude, address: address)
	end
end
