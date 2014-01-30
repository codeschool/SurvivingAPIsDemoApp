require 'test_helper'

class ListingZombiesTest < ActionDispatch::IntegrationTest
  test 'returns zombies in JSON' do
    get '/zombies', {}, { 'Accept' => Mime::JSON }

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
  end

  test 'returns zombies in XML' do
    get '/zombies', {}, { 'Accept' => Mime::XML }

    assert_equal 200, response.status
    assert_equal Mime::XML, response.content_type
  end
end
