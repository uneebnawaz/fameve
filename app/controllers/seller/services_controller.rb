class Seller::ServicesController < ApplicationController
	def index
		@services = current_user.services
	end

	def new
		@service = Service.new
	end

	def create
		@service = Service.new(service_params)
		@service.user_id = current_user.id
		if @service.valid?
			@service.save
			redirect_to seller_service_path(@service)
		else
			redirect_to new_seller_service_path
		end
	end

	def edit
		@service = Service.find(params[:id])
	end

	def update
 		@service = Service.find(params[:id])
    	@service.update(service_params)
    	redirect_to seller_service_path(@service)
	end

	def destroy
		@service = Service.find(params[:id])
    	@service.delete
		redirect_to seller_services_path
	end

	def show
		@reviews = Review.where(service_id: params[:id])
		@service = Service.find(params[:id])
	end

	def view_sales
		bookings = Booking.where(status: "mark_done")
		bookings = bookings.joins(:service).where(services: { user_id: current_user.id })
		@services = bookings.map(&:service)
	end

	private

	def service_params
		params.require(:service).permit(:tittle, :description, :price, :portfolio, :image, :event_type, :user_id, :category)
	end
end