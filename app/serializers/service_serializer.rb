class ServiceSerializer < ActiveModel::Serializer 
	attributes :tittle, :description, :price, :portfolio, :user_id, :like, :ratings, :reviews, :category, :image_attachment

	def image_attachment
	    if object.image.attached?
	      {
	        url: Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true)
	      }
	    end
  	end
end
