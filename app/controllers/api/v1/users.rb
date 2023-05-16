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

        post 'forgot_password' do
          @user = User.find_by(email: params[:email])
          if @user.present?
            UserMailer.with(user: @user).buyer_forgot_password.deliver_now
            { message: 'Instructions sent to your email.' }
          else
            error!('User not found.', 404)
          end
        end

        post 'change_password' do
          @user = User.find_by(email: params[:email])
          if @user.present?
            password = params[:password]
            password_confirmation = params[:password_confirmation]
            @user.update(password: password, password_confirmation: password_confirmation)
            { message: 'Password is Changed' }
          else
            error!('User not found.', 404)
          end
        end

        post 'sign_up' do
          email = params[:email]
          password = params[:password]
          password_confirmation = params[:password_confirmation]
          role = 1
          city = params[:city]
          fname = params[:fname]
          lname = params[:lname]
          phone = params[:phone]
          address = params[:address]
          authentication_token = SecureRandom.hex(32)
          user = User.new(email: email, password: password, password_confirmation: password_confirmation, role: role, city: city, fname: fname, lname: lname, phone: phone, address: address, authentication_token: authentication_token)
          user.save
        end
        patch do
          user = User.where(authentication_token: params[:authentication_token])
          if user.present?
            user.update(authentication_token: nil)
          else
            error!('Invalid user', 401)
          end
        end
        get do
          User.where(role: "seller")
        end
        patch 'edit_profile' do
          city = params[:city]
          fname = params[:fname]
          lname = params[:lname]
          phone = params[:phone]
          address = params[:address]
          user = User.where(authentication_token: params[:authentication_token])
          if user.present?
            user.update(city: city, fname: fname, lname: lname, phone: phone, address: address)
          else
            error!('Invalid user', 401)
          end
        end
        get 'show/:authentication_token' do
          user = User.where(authentication_token: params[:authentication_token])
          if user.present?
            user
          else
            error!('Invalid user', 401)
          end
        end

      end
    end
  end
end
