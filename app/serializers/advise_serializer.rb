class AdviseSerializer < ActiveModel::Serializer 
	attributes :id, :subject, :user_id, :description, :advise
end
