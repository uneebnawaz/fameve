module API
  module V1
    class Packages < Grape::API
      include API::V1::Defaults

      resource :packages do
        desc "Generate package" 
        get "" do
          event_type = params[:event_type]
          high = params[:high]
          low = params[:low]
          Service.where(event_type: event_type, price: low..high)
        end
      end

    end
  end
end