class ExampleMailer < ApplicationMailer
  default from: "nandini2052@gmail.com"
  def sample_email(seller,user)
    @seller = seller
    @user = user
     @url  = 'http://www.gmail.com'
    mail(to: @seller.email, subject: 'Sample Email')
  end
end
