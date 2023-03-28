module API
  module V1
    class Bookings < Grape::API
      include API::V1::Defaults

      resource :bookings do
        get ":user_id" do
          Booking.where(user_id: params[:user_id])
        end

        post do
          city = params[:city]
          address = params[:address]
          phone = params[:phone]
          description = params[:description]
          event_date = params[:event_date]
          service_id = params[:service_id]
          user_id = params[:user_id]
          booking = Booking.new(city: city, address: address, phone: phone, description: description, event_date: event_date, user_id: user_id, service_id: service_id)
          booking.save
        end
      end
    end
  end
end