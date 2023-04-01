module API
  module V1
    class Reviews < Grape::API
      include API::V1::Defaults
      resource :reviews do
        post do
          service_id = params[:service_id]
          booking_id = params[:booking_id]
          user_id = params[:user_id]
          rating = params[:rating]
          description = params[:description]
          booking = Booking.where(id: booking_id, review_status: false)
          if booking.present?
            review = Review.new(user_id: user_id, service_id: service_id, booking_id: booking_id, rating: rating, description: description)
            if review.save
              booking.update(review_status: true)
            end
          else
            error!('The review is already given', 400)
          end
        end
        get ":service_id" do
          Review.where(status: true, service_id: service_id)
        end
        get "" do
          Review.where(user_id: params[:user_id], booking_id: params[:booking_id])
        end
      end
    end
  end
end