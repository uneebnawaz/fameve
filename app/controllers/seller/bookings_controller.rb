class Seller::BookingsController < ApplicationController
	def index
		bookings_scope = Booking.joins(:service).where(services: { user_id: current_user.id }).order(event_date: :desc)
		case params[:filter_by]
		when "date"
		  bookings_scope = Booking.joins(:service).where(services: { user_id: current_user.id }).order(event_date: :asc)
		when "none"
		  # do nothing
		end
		@bookings = bookings_scope
	end

	def new
		@booking = Booking.new
	end

	def create
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
		@booking = Booking.find(params[:id])
	end

	def update
 		@booking = Booking.find(params[:id])
	    @booking.update(booking_params)
	    redirect_to seller_bookings_path
	end

	def show
		@booking = Booking.find(params[:id])
	end

	def destroy
		@booking = Booking.find(params[:id])
    	@booking.delete
		redirect_to seller_bookings_path
	end

	private

	def booking_params
		params.require(:booking).permit(:service_id, :description, :status, :event_date, :city, :address, :phone, :user_id)
	end
end