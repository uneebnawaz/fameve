class UserSerializer < ActiveModel::Serializer 
	attributes :id, :email, :role, :city, :fname, :lname, :phone, :address, :skill, :experience, :education, :certification, :status, :authentication_token, :encrypted_password, :longitude, :latitude, :image_attachment
	def image_attachment
	    if object.image.attached?
	      {
	        url: Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true)
	      }
	    end
  	end
end
