class ServiceSerializer < ActiveModel::Serializer 
	attributes :tittle, :description, :price, :portfolio, :user_id
end
