class AddReviewStatusToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :review_status, :boolean, default: false
  end
end
