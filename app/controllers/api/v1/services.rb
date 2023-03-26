module API
  module V1
    class Services < Grape::API
      include API::V1::Defaults

      resource :services do
        desc "Return all services"
        get "" do
          Service.all
        end

      desc "Return a user" 
        params do
          requires :id, type: String, desc: "ID of the service"
        end
        get ":id" do
          Service.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end