class PortalController < ApplicationController
  include PortalHelper
  before_action :set_contact, only: %i[web_form tutor_form employee_form]

  # GET /portal
  # GET /portal.json
  def index; end

  # def about; end

  # GET /web_form
  def web_form
    # @contact = Contact.new
  end

  # POST /web_form
  def web_form_send
    @contact = Contact.create(contact_params)
    ContactMailer.with(user: @contact).contact_me(@contact).deliver_now
    # Contact.first.destroy
    # flash[:notice] = 'Hello'
    # render :index
    redirect_to root_path, notice: 'Your message was sent!'
  end

  def waiting_room
    @contact = Contact.new
    # @students = Student.all
    @appointments = Appointment.all
    # @contact = Contact.create(contact_params)
    # # @user = Contact.first
    # ContactMailer.with(user: @user).contact_me.deliver_now
    # Contact.first.destroy
    # # flash[:notice] = 'Hello'
    # # render :index
    # redirect_to root_path, notice: 'Your message was sent!'
  end

  def meeting_room
    # callee = User.find_by(name: params[:format])
    # contact = Contact.find(params[:format])
    @token = create_token(params)
    @classroom = params[:format]
    # @token = this_is_a_test(params[:format])
  end

  def start_room
    # p current_user
    @contact = Contact.create(contact_params)
    email_token = create_email_token(current_user.room_name, @contact.name)
    @contact.update(room_token: email_token)
    @contact.update(room_name: current_user.room_name)
    ContactMailer.with(user: @contact).enter_room(@contact, current_user).deliver_now
    # Contact.first.destroy
    # flash[:notice] = 'Hello'
    # render :index
    # this_is_a_test
    # call_id = SecureRandom.uuid
    # call_id = @contact.name
    # create_room(call_id)
    redirect_to video_chat_path(current_user.room_name),
                notice: 'Your message was sent!'
  end

  def send_request
    # p params
    @contact = Contact.create(contact_params)
    ContactMailer.with(user: @contact).request_call(@contact).deliver_now
    # Contact.first.destroy
    # flash[:notice] = 'Hello'
    # render :index
    # this_is_a_test('Brandon')
    redirect_to video_chat_path('Conference_Room'), notice: 'Your message was sent!'
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

  def set_contact
    @contact = Contact.new
  end
end
