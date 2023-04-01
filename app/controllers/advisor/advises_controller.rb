class Advisor::AdvisesController < ApplicationController
	def index
		@advises = Advise.all
	end

	def edit
		@advise = Advise.find(params[:id])
	end

	def update
 		@advise = Advise.find(params[:id])
    	@advise.update(advise_params)
    	redirect_to advisor_advises_path(@advise)
	end

	def show
		@advise = Advise.find(params[:id])
	end

	def destroy
		@advise = Advise.find(params[:id])
    	@advise.delete
		redirect_to advisor_advises_path
	end

	private

	def advise_params
		params.require(:advise).permit(:subject, :description, :user_id, :advise)
	end

end
