class User < ApplicationRecord
  default_scope { where(status: true) }
  has_many :services
  has_many :bookings
  has_many :post_requests
  has_one_attached :image, :dependent => :destroy
  enum role: {seller: 0, buyer: 1, admin: 2}, _default: 0
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    def generate_authentication_token
        token = SecureRandom.hex(32)
        update(authentication_token: token)
        token
    end
end
