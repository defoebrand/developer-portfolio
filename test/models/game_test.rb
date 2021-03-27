require 'test_helper'

class GameTest < ActiveSupport::TestCase
  def setup
    @good_game = games(:good_game)
    @only_url = games(:only_url)
    @only_title = games(:only_title)
    @only_description = games(:only_description)
    @only_mobile_description = games(:only_mobile_description)
    @url_title = games(:url_title)
    @url_desc = games(:url_desc)
    @url_mob_desc = games(:url_mob_desc)
    @title_desc = games(:title_desc)
    @title_mob_desc = games(:title_mob_desc)
    @desc_mob_desc = games(:desc_mob_desc)
    @url_title_desc = games(:url_title_desc)
    @url_title_mob_desc = games(:url_title_mob_desc)
    @url_desc_mob_desc = games(:url_desc_mob_desc)
  end

  test 'new game with only url' do
    assert @only_url.invalid?
  end

  test 'new game with only title' do
    assert @only_title.invalid?
  end

  test 'new game with only description' do
    assert @only_description.invalid?
  end

  test 'new game with only mobile_description' do
    assert @only_mobile_description.invalid?
  end

  test 'new game with only url and title' do
    assert @url_title.invalid?
  end

  test 'new game with only url and description' do
    assert @url_desc.invalid?
  end

  test 'new game with only url and mobile_description' do
    assert @url_mob_desc.invalid?
  end

  test 'new game with only title and description' do
    assert @title_desc.invalid?
  end

  test 'new game with only title and mobile_description' do
    assert @title_mob_desc.invalid?
  end

  test 'new game with only description and mobile_description' do
    assert @desc_mob_desc.invalid?
  end

  test 'new game with url, title, and description' do
    assert @url_title_desc.invalid?
  end

  test 'new game with url, title, and mobile_description' do
    assert @url_title_mob_desc.invalid?
  end

  test 'new game with url, description, and mobile_description' do
    assert @url_desc_mob_desc.invalid?
  end

  test 'new game with url, title, description, and mobile_description' do
    assert @good_game.valid?
  end
end
