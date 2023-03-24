module API
  module V1
    class PostRequests < Grape::API
      include API::V1::Defaults

      resource :post_requests do
        post do
          tittle = params[:tittle]
          description = params[:description]
          email = params[:email]
          city = params[:city]
          address = params[:address]
          phone = params[:phone]
          event_date = params[:event_date]
          user_id = params[:user_id]
          booking = PostRequest.new(city: city, address: address, phone: phone, description: description, event_date: event_date, user_id: user_id, email: email, tittle: tittle)
          booking.save
        end
      end
    end
  end
end