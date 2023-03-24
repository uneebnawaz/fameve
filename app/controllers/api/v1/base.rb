module API
  module V1
    class Base < Grape::API
      mount API::V1::Services
      mount API::V1::Bookings
      mount API::V1::Users
      mount API::V1::PostRequests
    end
  end
end