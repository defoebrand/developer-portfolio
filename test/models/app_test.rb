require 'test_helper'

class AppTest < ActiveSupport::TestCase
  def setup
    @good_app = apps(:good_app)
    @only_url = apps(:only_url)
    @only_title = apps(:only_title)
    @only_description = apps(:only_description)
    @only_mobile_description = apps(:only_mobile_description)
    @url_title = apps(:url_title)
    @url_desc = apps(:url_desc)
    @url_mob_desc = apps(:url_mob_desc)
    @title_desc = apps(:title_desc)
    @title_mob_desc = apps(:title_mob_desc)
    @desc_mob_desc = apps(:desc_mob_desc)
    @url_title_desc = apps(:url_title_desc)
    @url_title_mob_desc = apps(:url_title_mob_desc)
    @url_desc_mob_desc = apps(:url_desc_mob_desc)
  end

  test 'new app with only url' do
    assert @only_url.invalid?
  end

  test 'new app with only title' do
    assert @only_title.invalid?
  end

  test 'new app with only description' do
    assert @only_description.invalid?
  end

  test 'new app with only mobile_description' do
    assert @only_mobile_description.invalid?
  end

  test 'new app with only url and title' do
    assert @url_title.invalid?
  end

  test 'new app with only url and description' do
    assert @url_desc.invalid?
  end

  test 'new app with only url and mobile_description' do
    assert @url_mob_desc.invalid?
  end

  test 'new app with only title and description' do
    assert @title_desc.invalid?
  end

  test 'new app with only title and mobile_description' do
    assert @title_mob_desc.invalid?
  end

  test 'new app with only description and mobile_description' do
    assert @desc_mob_desc.invalid?
  end

  test 'new app with url, title, and description' do
    assert @url_title_desc.invalid?
  end

  test 'new app with url, title, and mobile_description' do
    assert @url_title_mob_desc.invalid?
  end

  test 'new app with url, description, and mobile_description' do
    assert @url_desc_mob_desc.invalid?
  end

  test 'new app with url, title, description, and mobile_description' do
    assert @good_app.valid?
  end
end
