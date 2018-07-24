class ExampleMailer < ApplicationMailer
  default from: "pratheepkumar4397@gmail.com"
  def sample_email(user,cuser)
    @user = user
    @cuser = cuser
     @url  = 'http://www.gmail.com'
    mail(to: @user.email, subject: 'Sample Email')
  end
end
