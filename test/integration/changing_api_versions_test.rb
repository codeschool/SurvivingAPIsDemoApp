require 'test_helper'

class ChangingApiVersionsTest < ActionDispatch::IntegrationTest

  setup do
    @ip = '123.123.12.12'
  end

  test 'returns version one via Accept header' do
    get '/zombies', {}, { 'REMOTE_ADDR' => @ip, 'HTTP_ACCEPT' => 'application/vnd.apocalypse.v1+json' }
    assert_equal 200, response.status
    assert_equal "#{@ip} Version One!", response.body
    assert_equal Mime::JSON, response.content_type
  end

  test 'returns version two via Accept header' do
    get '/zombies', {}, { 'REMOTE_ADDR' => @ip, 'HTTP_ACCEPT' => 'application/vnd.apocalypse.v2+json' }
    assert_equal 200, response.status
    assert_equal "#{@ip} Version Two!", response.body
    assert_equal Mime::JSON, response.content_type
  end
end
