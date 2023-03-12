class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  default_scope { where(status: true) }
  has_many :services
  has_many :bookings
  has_one_attached :image, :dependent => :destroy
  enum role: {seller: 0, buyer: 1, admin: 2}, _default: 0
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
