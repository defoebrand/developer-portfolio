class ContactMailer < ApplicationMailer
  default from: 'defoe.brand@gmail.com'

  def contact_me(contact)
    me = 'defoe.brand@gmail.com'
    @contact = contact
    mail(to: me, subject: "Email from #{contact.name}")
  end

  def enter_room(recipient, sender)
    @sender = sender
    @contact = recipient
    mail(to: recipient.email, subject: 'Join me for a call')
  end

  def request_call(contact)
    me = 'defoe.brand@gmail.com'
    @contact = contact
    mail(to: me, subject: "Incoming Call from #{contact.name}")
  end
end
