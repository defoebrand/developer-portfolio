class PortalController < ApplicationController
  before_action :set_contact, only: %i[web_form tutor_form employee_form]

  require 'uri'
  require 'net/http'
  require 'openssl'
  require 'securerandom'

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
    p params
    # callee = User.find_by(name: params[:format])
    # contact = Contact.find(params[:format])
    @token = create_token(params[:room_token])
    @classroom = params[:format]
    # @token = this_is_a_test(params[:format])
  end

  def start_room
    @contact = Contact.create(contact_params)
    email_token = create_email_token(current_user.room_name)
    @contact.update(room_token: email_token)
    @contact.update(room_name: current_user.room_name)
    ContactMailer.with(user: @contact).enter_room(@contact).deliver_now
    # Contact.first.destroy
    # flash[:notice] = 'Hello'
    # render :index
    # this_is_a_test
    # call_id = SecureRandom.uuid
    # call_id = @contact.name
    # create_room(call_id)
    redirect_to video_chat_path(current_user.room_name), notice: 'Your message was sent!'
  end

  def send_request
    p params
    @contact = Contact.create(contact_params)
    ContactMailer.with(user: @contact).request_call(@contact).deliver_now
    # Contact.first.destroy
    # flash[:notice] = 'Hello'
    # render :index
    # this_is_a_test('Brandon')
    redirect_to video_chat_path('Brandon'), notice: 'Your message was sent!'
  end

  def this_is_a_test(name)
    p name
    # name = 'Classroom' if name == 'Brandon'
    url = URI('https://api.daily.co/v1/meeting-tokens')

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request['Content-Type'] = 'application/json'
    request['Authorization'] = 'Bearer 84a3583043afeb6745cf0b8f1e885f38b871d494b3d95e9260f4fa5235cd516c'
    request.body = '{"properties":{"room_name":"' + name + '"}}'

    response = http.request(request)
    puts response.read_body
    response.read_body
  end

  def create_room(room_id)
    url = URI('https://api.daily.co/v1/rooms')

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request['Content-Type'] = 'application/json'
    request['Authorization'] = 'Bearer 84a3583043afeb6745cf0b8f1e885f38b871d494b3d95e9260f4fa5235cd516c'
    request.body = '{"properties":{"autojoin":true,"enable_screenshare":true,"enable_knocking":false,"enable_chat":true,
    "start_video_off":false,"start_audio_off":false},"privacy":"private","name":"' + room_id + '"}'
    response = http.request(request)
    puts response.read_body
    # hash = JSON.parse response.read_body
    # if hash['id']
    #   url = URI('https://api.daily.co/v1/meeting-tokens')
    #
    #   http = Net::HTTP.new(url.host, url.port)
    #   http.use_ssl = true
    #   http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    #
    #   request = Net::HTTP::Post.new(url)
    #   request['Content-Type'] = 'application/json'
    #   request['Authorization'] = 'Bearer 84a3583043afeb6745cf0b8f1e885f38b871d494b3d95e9260f4fa5235cd516c'
    #   request.body = '{"properties":{"room_name":"' + room_id + '","is_owner":true,"user_name":"Brandon","enable_screenshare":true,"start_video_off":false,"start_audio_off":false}}'
    #
    #   response = http.request(request)
    #   # puts response.read_body
    #   token = response.read_body
    #   puts 'here is the token'
    #   token_id = JSON.parse(token)['token']
    #   # puts token_id['token']
    # end
    # localStorage['room_token'] = token_id['token']
    # puts token_id['token']
    # redirect_to "/video_chat/#{token_id}", notice: 'Your message was sent!'
    # response.read_body
  end

  def create_token(token)
    url = URI('https://api.daily.co/v1/meeting-tokens')

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request['Content-Type'] = 'application/json'
    request['Authorization'] = 'Bearer 84a3583043afeb6745cf0b8f1e885f38b871d494b3d95e9260f4fa5235cd516c'
    request.body = user_signed_in? ? current_user.room_token : token
    puts request.body
    response = http.request(request)
    token = response.read_body
    puts token

    token_id = JSON.parse(token)['token']

    token_id
  end

  def create_email_token(roomname)
    url = URI('https://api.daily.co/v1/meeting-tokens')

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request['Content-Type'] = 'application/json'
    request['Authorization'] = 'Bearer 84a3583043afeb6745cf0b8f1e885f38b871d494b3d95e9260f4fa5235cd516c'
    request.body = '{"properties":{"room_name":"' + roomname + '","is_owner":false,"user_name":"Brandon","enable_screenshare":true,"start_video_off":false,"start_audio_off":false}}'
    puts request.body
    response = http.request(request)
    token = response.read_body
    puts token

    token_id = JSON.parse(token)['token']

    token_id
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
