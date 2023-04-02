module API
  module V1
    class Advises < Grape::API
      include API::V1::Defaults

      resource :advises do
        get ":id" do
          advise = AdviseRequest.find_by(id: params[:id])
          advise
        end

        post do
          name = params[:name]
          email = params[:email]
          phone = params[:phone]
          description = params[:description]
          advise = AdviseRequest.new(name: name, email: email, phone: phone, description: description)
          advise.save
        end
      end
    end
  end
end