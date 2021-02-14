class PortalController < ApplicationController
  before_action :set_contact, only: %i[web_form tutor_form employee_form]
  # GET /portal
  # GET /portal.json
  def index; end

  # def about; end

  # GET /web_form
  def web_form
    # @contact = Contact.new
  end

  # GET /tutor_form
  def tutor_form
    # @contact = Contact.new
  end

  # GET /employee_form
  def employee_form
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
    # @contact = Contact.create(contact_params)
    # # @user = Contact.first
    # ContactMailer.with(user: @user).contact_me.deliver_now
    # Contact.first.destroy
    # # flash[:notice] = 'Hello'
    # # render :index
    # redirect_to root_path, notice: 'Your message was sent!'
  end

  def meeting_room
    @uuid = 'uniqueStringHere'
  end

  def start_room
    @contact = Contact.create(contact_params)
    ContactMailer.with(user: @contact).enter_room(@contact).deliver_now
    # Contact.first.destroy
    # flash[:notice] = 'Hello'
    # render :index
    redirect_to video_chat_path, notice: 'Your message was sent!'
  end

  def send_request
    p params
    @contact = Contact.create(contact_params)
    ContactMailer.with(user: @contact).request_call(@contact).deliver_now
    # Contact.first.destroy
    # flash[:notice] = 'Hello'
    # render :index
    redirect_to video_chat_path, notice: 'Your message was sent!'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_website
  #   @website = Website.find(params[:id])
  # end

  # Only allow a list of trusted parameters through.
  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

  def set_contact
    @contact = Contact.new
  end
end
