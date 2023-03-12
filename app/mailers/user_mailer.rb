class UserMailer < ApplicationMailer
  default from: 'f190237@nu.edu.pk'

  def query_reply
    @contact = params[:contact]
    mail(to: @contact.email, subject: 'Query Reply')
  end
end
