class UserMailer < ApplicationMailer
  default from: 'contact.uneebnawaz@gmail.com'

  def query_reply
    @contact = params[:contact]
    mail(to: @contact.email, subject: 'Query Reply')
  end

  def request_reply
    @request = params[:request]
    mail(to: @request.email, subject: 'Response of your Request')
  end

  def buyer_forgot_password
    @user = params[:user]
    mail(to: @user.email, subject: 'Account Recovery')
  end

end
