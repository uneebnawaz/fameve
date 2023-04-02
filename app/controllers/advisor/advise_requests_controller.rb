class Advisor::AdviseRequestsController < ApplicationController
	def index
		@advises = AdviseRequest.all
	end

	def show
		@advise = AdviseRequest.find(params[:id])
	end

	def destroy
		@advise = AdviseRequest.find(params[:id])
    	@advise.delete
		redirect_to advisor_advise_requests_path
	end

	private

	def advise_params
		params.require(:advise).permit(:name, :email, :phone, :description)
	end

end
