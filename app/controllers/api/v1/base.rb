module API
  module V1
    class Base < Grape::API
      mount API::V1::Services
      mount API::V1::Bookings
      mount API::V1::Users
      mount API::V1::PostRequests
      mount API::V1::Wishlists
      mount API::V1::Packages
      mount API::V1::Reviews
      mount API::V1::Advises
    end
  end
end