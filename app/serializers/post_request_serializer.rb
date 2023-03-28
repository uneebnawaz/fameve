class PostRequestSerializer < ActiveModel::Serializer 
	attributes :id, :tittle, :description, :budget, :city, :phone, :address, :user_id, :event_date, :email
end
