class Admin::ReviewsController < ApplicationController
	def index
		@reviews = Review.all
	end

	def update
		@review = Review.find(params[:id])
		@review.update(status: !@review.status)
		redirect_to admin_reviews_path
	end
end