class HomeController < ApplicationController
	before_action :authenticate_user!, except: [:index, :team, :about]

	def index
	end

	def team
	end

	def about
	end

end
