require 'test_helper'

class PortalControllerTest < ActionDispatch::IntegrationTest
  test 'should get portal index' do
    get root_url
    assert_response :success
  end

  test 'should get contacts index' do
    get contacts_url
    assert_response :success
  end

  test 'should get video_chat index' do
    get video_chat_url
    assert_response :success
  end

  test 'should get waiting_room index' do
    get waiting_room_url
    assert_response :success
  end
end
