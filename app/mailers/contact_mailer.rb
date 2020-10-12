class ContactMailer < ApplicationMailer
  default from: 'defoe.brand@gmail.com'

  def contact_me
    @my = User.first
    kristina = 'kristi.kazlauskaite@gmail.com'
    @contact = Contact.first
    @url = 'http://example.com/login'
    # mail(to: @my.email, subject: 'Welcome to My Awesome Site')
    mail(to: kristina, subject: 'Welcome to My Awesome Site')
  end
end
