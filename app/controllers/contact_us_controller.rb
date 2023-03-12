class ContactUsController < ApplicationController
	before_action :authenticate_user!, except: [:new, :create]

	def new
		@contact = ContactUs.new
	end

	def create
		@contact = ContactUs.new(contact_params)
		if @contact.valid?
			@contact.save
			redirect_to home_path
		else
			redirect_to new_contact_path
		end
	end

	private

	def contact_params
		params.require(:contact_us).permit(:name, :email, :phone, :subject, :description, :reply)
	end
end