module PortalHelper
  require 'uri'
  require 'net/http'
  require 'openssl'
  require 'securerandom'
  def this_is_a_test(name)
    # p name
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

  def create_token(params)
    # puts params
    # puts current_user
    return params[:room_token] if params[:room_token]

    url = URI('https://api.daily.co/v1/meeting-tokens')

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request['Content-Type'] = 'application/json'
    request['Authorization'] = 'Bearer 84a3583043afeb6745cf0b8f1e885f38b871d494b3d95e9260f4fa5235cd516c'
    test_token =
      '{"properties":{"room_name":"with_Brandon","redirect_on_meeting_exit":"https://www.defoebrand.com/schedule","is_owner":true,"user_name":"Brandon","enable_screenshare":true,"start_video_off":false,"start_audio_off":false}}'
    #
    # '{"properties":{"autojoin":true,"enable_screenshare":true,"enable_knocking":false,"enable_chat":true,
    #       "start_video_off":false,"start_audio_off":false},"privacy":"private","name":"' + room_name + '"}'
    # p 'hello'
    # request.body = user_signed_in? ? current_user.room_token : params[:room_token]
    request.body = user_signed_in? ? test_token : params[:room_token]
    puts request.body
    response = http.request(request)
    token_json = response.read_body
    # p token
    token = JSON.parse(token_json)['token']
    # p token_id
    # params[:room_token] || token_id
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
    puts request.body
    response = http.request(request)
    token = response.read_body
    puts token

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
      "start_video_off":false,"start_audio_off":false},"privacy":"private","name":"' + room_name + '"}'
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
    redirect_to video_chat_path(room_name),
                notice: 'Your message was sent!'
  end
end
