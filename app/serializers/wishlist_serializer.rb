class WishlistSerializer < ActiveModel::Serializer 
	attributes :id, :service_id, :user_id
end
