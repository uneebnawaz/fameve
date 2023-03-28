module API
  module V1
    class Wishlists < Grape::API
      include API::V1::Defaults
      resource :wishlists do
        post do
          service_id = params[:service_id]
          user_id = params[:user_id]
          wishlist = Wishlist.new(user_id: user_id, service_id: service_id)
          wishlist.save
        end
        get ":user_id" do
          Wishlist.where(user_id: params[:user_id])
        end
        delete ':user_id/:service_id' do
          wishlist = Wishlist.find_by(user_id: params[:user_id], service_id: params[:service_id])
          if wishlist&.destroy
            { message: "Removed from Wishlist" }
          else
            error!('Failed to remove', 400)
          end
        end
      end
    end
  end
end