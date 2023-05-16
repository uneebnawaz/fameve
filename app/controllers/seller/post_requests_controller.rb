class Seller::PostRequestsController < ApplicationController
	def index
		bookings_scope = PostRequest.all.order(event_date: :desc)
		case params[:filter_by]
		when "date"
		  bookings_scope = PostRequest.all.order(event_date: :asc)
		when "none"
		  # do nothing
		end
		@requests = bookings_scope
	end


	def show
		@request = PostRequest.find(params[:id])
	end

	def request_reply
		@request = PostRequest.new(request_params)
		UserMailer.with(request: @request).request_reply.deliver_now
		respond_to do |format|
			@requests = PostRequest.all
			format.html { render action: 'index' }
		end
	end


	private

	def request_params
		params.require(:post_request).permit(:tittle, :description, :event_date, :city, :email, :address, :phone, :user_id, :reply, :budget)
	end
end