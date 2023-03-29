module API
  module V1
    class Reviews < Grape::API
      include API::V1::Defaults
      resource :reviews do
        post do
          service_id = params[:service_id]
          user_id = params[:user_id]
          description = params[:description]
          review = Review.new(user_id: user_id, service_id: service_id, description: description)
          review.save
        end
        get "" do
          Review.all
        end
      end
    end
  end
end