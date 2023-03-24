module API
  module V1
    class Users < Grape::API
      include API::V1::Defaults
      resource :users do
        desc 'Create a user'
        params do
          requires :email, type: String, desc: 'Email address'
          requires :password, type: String, desc: 'Password'
        end
        post do
          user = User.find_for_database_authentication(email: params[:email])
          if user && user.valid_password?(params[:password])
            # Sign in the user and return an access token
            token = user.generate_authentication_token
            { auth_token: token }
          else
            error!('Invalid email or password', 401)
          end
        end
      end
    end
  end
end
