class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  default_scope { where(status: true) }
  has_many :services, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :post_requests, dependent: :destroy
  has_many :wishlists, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :image, :dependent => :destroy
  enum role: {seller: 0, buyer: 1, admin: 2, advisor: 3}, _default: 0
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    def generate_authentication_token
        token = SecureRandom.hex(32)
        update(authentication_token: token)
        token
    end
end
