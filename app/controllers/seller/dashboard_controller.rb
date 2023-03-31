class Seller::DashboardController < ApplicationController
	def index
		@bookings = Booking.joins(:service).where(services: { user_id: current_user.id })
		bookings = Booking.where(status: "mark_done")
		bookings = bookings.joins(:service).where(services: { user_id: current_user.id })
		@services = bookings.map(&:service)
		@total_services = current_user.services
		@requests = PostRequest.all
	end
end
