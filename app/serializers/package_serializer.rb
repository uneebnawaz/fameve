class PackageSerializer < ActiveModel::Serializer 
	attributes :id, :tittle, :description, :price, :portfolio, :user_id, :like, :ratings, :reviews, :category
end
