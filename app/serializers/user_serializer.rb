class UserSerializer < ActiveModel::Serializer 
	attributes :email, :role, :username, :fname, :lname, :phone, :address, :skill, :experience, :education, :certification, :status, :authentication_token, :encrypted_password
end
