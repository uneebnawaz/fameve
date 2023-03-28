class ServiceSerializer < ActiveModel::Serializer 
	attributes :id, :tittle, :description, :price, :portfolio, :user_id, :category, :image_attachment

	def image_attachment
	    if object.image.attached?
	      {
	        url: Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true)
	      }
	    end
  	end
end
