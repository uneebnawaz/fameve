module API
  module V1
    class Advises < Grape::API
      include API::V1::Defaults

      resource :advises do
        get ":id" do
          advise = Advise.find_by(id: params[:id])
          if advise.present? && advise.advise.present?
            advise
          else
            error!('The advisor hasnt responded yet', 400)
          end
        end

        post do
          subject = params[:subject]
          description = params[:description]
          user_id = params[:user_id]
          advise = Advise.new(subject: subject, description: description, user_id: user_id)
          advise.save
        end
      end
    end
  end
end