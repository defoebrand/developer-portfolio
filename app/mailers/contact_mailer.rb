class ContactMailer < ApplicationMailer
  default from: 'defoe.brand@gmail.com'

  def contact_me(contact)
    # @my = User.first
    me = 'defoe.brand@gmail.com'
    @contact = contact
    # @url = 'http://example.com/login'
    mail(to: me, subject: 'Email from Portfolio')
  end

  def enter_room(recipient, sender)
    @contact = recipient
    @sender = sender
    mail(to: @contact.email, subject: 'Join me for a call')
  end

  def request_call(contact)
    # @my = User.first
    me = 'defoe.brand@gmail.com'
    @contact = contact
    # @url = 'http://example.com/login'
    mail(to: me, subject: 'Incoming Call from <%= contact.name %>')
  end
end
