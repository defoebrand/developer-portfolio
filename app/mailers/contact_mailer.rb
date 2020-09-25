class ContactMailer < ApplicationMailer
  default from: 'defoe.brand@gmail.com'

  def contact_me
    @user = User.first
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
