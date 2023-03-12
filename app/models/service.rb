class Service < ApplicationRecord
	has_one_attached :image, :dependent => :destroy
	has_many :bookings
	belongs_to :user
end
