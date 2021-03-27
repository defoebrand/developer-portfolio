class PortalController < ApplicationController
  include PortalHelper
  before_action :set_contact, only: %i[web_form_send start_room send_request]

  def web_form_send
    ContactMailer.with(user: @contact).contact_me(@contact).deliver_now
    redirect_to root_path, notice: 'Your message was sent!'
  end

  def waiting_room
    @contact = Contact.new
    @appointments = Appointment.all
  end

  def meeting_room
    @token = create_token(params)
    @classroom = params[:format]
  end

  def start_room
    @contact = Contact.find_or_create_by(email: contact_params[:email])
    email_token = create_email_token(current_user.room_name, @contact.name)
    @contact.update(room_token: email_token)
    @contact.update(room_name: current_user.room_name) unless @contact.room_name == current_user.room_name
    ContactMailer.with(user: @contact).enter_room(@contact, current_user).deliver_now
    create_room(current_user.room_name)
  end

  def send_request
    ContactMailer.with(user: @contact).request_call(@contact).deliver_now
    redirect_to video_chat_path('Conference_Room'), notice: 'Your message was sent!'
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

  def set_contact
    @contact = Contact.find_or_create_by(email: contact_params[:email])
  end
end
