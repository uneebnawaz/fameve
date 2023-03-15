class Seller::ServicesController < ApplicationController
	def index
		@user = User.find(current_user.id)
		@services = current_user.services
	end

	def new
		@user = User.find(current_user.id)
		@service = Service.new
	end

	def create
		@user = User.find(current_user.id)
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
		@user = User.find(current_user.id)
		@service = Service.find(params[:id])
	end

	def update
		@user = User.find(current_user.id)
 		@service = Service.find(params[:id])
    @service.update(service_params)
    redirect_to seller_service_path(@service)
	end

	def destroy
		@user = User.find(current_user.id)

		@service = Service.find(params[:id])
    @service.delete
		redirect_to seller_services_path
	end

	def show
		@user = User.find(current_user.id)
		@booking = Booking.new
		@service = Service.find(params[:id])
	end

	private

	def service_params
		params.require(:service).permit(:tittle, :description, :price, :portfolio, :image, :like, :ratings, :reviews, :user_id, :category)
	end
end