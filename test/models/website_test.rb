require 'test_helper'

class WebsiteTest < ActiveSupport::TestCase
  def setup
    @good_website = websites(:good_website)
    @only_url = websites(:only_url)
    @only_title = websites(:only_title)
    @only_description = websites(:only_description)
    @only_mobile_description = websites(:only_mobile_description)
    @url_title = websites(:url_title)
    @url_desc = websites(:url_desc)
    @url_mob_desc = websites(:url_mob_desc)
    @title_desc = websites(:title_desc)
    @title_mob_desc = websites(:title_mob_desc)
    @desc_mob_desc = websites(:desc_mob_desc)
    @url_title_desc = websites(:url_title_desc)
    @url_title_mob_desc = websites(:url_title_mob_desc)
    @url_desc_mob_desc = websites(:url_desc_mob_desc)
  end

  test 'new website with only url' do
    assert @only_url.invalid?
  end

  test 'new website with only title' do
    assert @only_title.invalid?
  end

  test 'new website with only description' do
    assert @only_description.invalid?
  end

  test 'new website with only mobile_description' do
    assert @only_mobile_description.invalid?
  end

  test 'new website with only url and title' do
    assert @url_title.invalid?
  end

  test 'new website with only url and description' do
    assert @url_desc.invalid?
  end

  test 'new website with only url and mobile_description' do
    assert @url_mob_desc.invalid?
  end

  test 'new website with only title and description' do
    assert @title_desc.invalid?
  end

  test 'new website with only title and mobile_description' do
    assert @title_mob_desc.invalid?
  end

  test 'new website with only description and mobile_description' do
    assert @desc_mob_desc.invalid?
  end

  test 'new website with url, title, and description' do
    assert @url_title_desc.invalid?
  end

  test 'new website with url, title, and mobile_description' do
    assert @url_title_mob_desc.invalid?
  end

  test 'new website with url, description, and mobile_description' do
    assert @url_desc_mob_desc.invalid?
  end

  test 'new website with url, title, description, and mobile_description' do
    assert @good_website.valid?
  end
end
