class Booking < ApplicationRecord
	belongs_to :user
	belongs_to :service
	has_one :review, dependent: :destroy
 	enum status: {pending: 1, in_progress: 2, mark_done: 3, rejected: 4}, _default: 1
end
