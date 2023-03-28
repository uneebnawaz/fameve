module API
  module V1
    class Packages < Grape::API
      include API::V1::Defaults

      resource :packages do
        desc "Generate package" 
        get "" do
          category = params[:category]
          high = params[:high]
          low = params[:low]
          services=Service.where(category: category, price: low..high)
          services
        end
      end

    end
  end
end