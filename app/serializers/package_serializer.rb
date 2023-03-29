class PackageSerializer < ActiveModel::Serializer 
	attributes :id, :tittle, :description, :price, :portfolio, :user_id, :category
end
