class BookingSerializer < ActiveModel::Serializer 
	attributes :service_id, :user_id, :status, :event_date, :city, :address, :phone, :description
end
