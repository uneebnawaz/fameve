class Seller::BookingsController < ApplicationController
	def index
		@user = User.find(current_user.id)
		@bookings = Booking.all
	end

	def new
		@user = User.find(current_user.id)
		@booking = Booking.new
	end

	def create
		@user = User.find(current_user.id)
		@booking = Booking.new(booking_params)
		@booking.user_id = current_user.id
		if @booking.valid?
			@booking.save
			redirect_to seller_services_path
		else
			redirect_to seller_services_path
		end
	end

	def edit
		@user = User.find(current_user.id)
		@booking = Booking.find(params[:id])
	end

	def update
		@user = User.find(current_user.id)
 		@booking = Booking.find(params[:id])
	    @booking.update(booking_params)
	    redirect_to booking_path(@booking)
	end

	def show
		@user = User.find(current_user.id)
		
		@booking = Booking.find(params[:id])
	end

	def destroy
		@user = User.find(current_user.id)
		@booking = Booking.find(params[:id])
    	@booking.delete
		redirect_to seller_bookings_path
	end

	private

	def booking_params
		params.require(:booking).permit(:service_id, :description, :status, :event_date, :city, :address, :phone, :user_id)
	end
end