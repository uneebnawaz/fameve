class AddBookingIdAndRatingToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :rating, :integer
    add_column :reviews, :booking_id, :integer
  end
end
