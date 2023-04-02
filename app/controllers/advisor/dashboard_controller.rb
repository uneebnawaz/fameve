class Advisor::DashboardController < ApplicationController
	def index
		@advises = AdviseRequest.all		
	end
end
