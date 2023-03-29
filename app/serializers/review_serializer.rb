class ReviewSerializer < ActiveModel::Serializer 
	attributes :id, :service_id, :user_id, :description
end
