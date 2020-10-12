class ContactMailer < ApplicationMailer
  default from: 'defoe.brand@gmail.com'

  def contact_me
    @my = User.first
    me = 'defoe.brand@gmail.com'
    @contact = Contact.first
    # @url = 'http://example.com/login'
    mail(to: me, subject: 'Email from Portfolio')
  end
end
