class Service < ApplicationRecord
	has_one_attached :image, :dependent => :destroy
	has_many :bookings, dependent: :destroy
	has_many :wishlists, dependent: :destroy
	belongs_to :user
end
