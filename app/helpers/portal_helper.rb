module PortalHelper
  require 'uri'
  require 'net/http'
  require 'openssl'
  require 'securerandom'

  def create_token(params)
    return params[:room_token] if params[:room_token]

    url = URI('https://api.daily.co/v1/meeting-tokens')

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request['Content-Type'] = 'application/json'
    request['Authorization'] = 'Bearer 84a3583043afeb6745cf0b8f1e885f38b871d494b3d95e9260f4fa5235cd516c'

    request.body = user_signed_in? ? current_user.room_token : params[:room_token]

    response = http.request(request)
    token_json = response.read_body
    token = JSON.parse(token_json)['token']

    token
  end

  def create_email_token(roomname, contact)
    url = URI('https://api.daily.co/v1/meeting-tokens')

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request['Content-Type'] = 'application/json'
    request['Authorization'] = 'Bearer 84a3583043afeb6745cf0b8f1e885f38b871d494b3d95e9260f4fa5235cd516c'
    request.body = '{"properties":{"room_name":"' +
                   roomname + '","is_owner":false,"user_name":"' +
                   contact + '","enable_screenshare":true,"start_video_off":false,"start_audio_off":false}}'
    response = http.request(request)
    token = response.read_body

    token_id = JSON.parse(token)['token']

    token_id
  end

  def create_room(room_name)
    url = URI('https://api.daily.co/v1/rooms')

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request['Content-Type'] = 'application/json'
    request['Authorization'] = 'Bearer 84a3583043afeb6745cf0b8f1e885f38b871d494b3d95e9260f4fa5235cd516c'
    request.body = '{"properties":{"autojoin":true,"enable_screenshare":true,"enable_knocking":false,"enable_chat":true,
    "redirect_on_meeting_exit":"https://www.defoebrand.com/schedule",
    "start_video_off":false,"start_audio_off":false},"privacy":"private","name":"' + room_name + '"}'
    response = http.request(request)
    puts response.body

    redirect_to video_chat_path(room_name),
                notice: 'Your message was sent!'
  end
end
