class Seller::PostRequestsController < ApplicationController
	def index
		@user = User.find(current_user.id)
		@requests = PostRequest.all
	end


	def show
		@user = User.find(current_user.id)
		@request = PostRequest.find(params[:id])
	end

	def request_reply
		binding.pry
		@user = User.find(current_user.id)
		@request = PostRequest.new(request_params)
		UserMailer.with(request: @request).request_reply.deliver_now
		respond_to do |format|
			@requests = PostRequest.all
			format.html { render action: 'index' }
		end
	end


	private

	def request_params
		params.require(:post_request).permit(:tittle, :description, :event_date, :city, :email, :address, :phone, :user_id, :reply)
	end
end