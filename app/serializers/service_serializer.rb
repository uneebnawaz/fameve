class ServiceSerializer < ActiveModel::Serializer 
	attributes :tittle, :description, :price, :portfolio, :user_id, :image, :like, :ratings, :reviews, :category
end
