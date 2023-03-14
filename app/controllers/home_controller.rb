class HomeController < ApplicationController
	before_action :authenticate_user!, except: [:index, :team, :about, :guide]

	def index
	end

	def team
	end

	def about
	end

	def guide
	end

end
