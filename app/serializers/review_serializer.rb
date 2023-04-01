class ReviewSerializer < ActiveModel::Serializer 
	attributes :id, :service_id, :user_id, :booking_id, :rating, :description, :status
end
