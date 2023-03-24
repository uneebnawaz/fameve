class ServiceSerializer < ActiveModel::Serializer 
	attributes :tittle, :description, :price, :portfolio, :user_id, :like, :ratings, :reviews, :category, :image_attachment
end
