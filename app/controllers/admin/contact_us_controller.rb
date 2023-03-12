class Admin::ContactUsController < ApplicationController
	def index
		@contacts = ContactUs.all
	end

	def destroy
		@contact = ContactUs.find(params[:id])
    	@contact.delete
		redirect_to admin_contact_us_path
	end

	def show
		@contact = ContactUs.find(params[:id])
	end

	def reply
		@contact = ContactUs.new(contact_params)
		UserMailer.with(contact: @contact).query_reply.deliver_now
		respond_to do |format|
			@contacts = ContactUs.all
			format.html { render action: 'index' }
		end
	end

	private

	def contact_params
		params.require(:contact_us).permit(:name, :email, :phone, :subject, :description, :reply)
	end
end