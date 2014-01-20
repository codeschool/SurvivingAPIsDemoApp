require 'test_helper'

class ChangingApiVersionsTest < ActionDispatch::IntegrationTest
  setup do
    @ip = '123.123.12.12'
  end

  test '/v1 returns version 1' do
    get '/v1/zombies', {}, { 'REMOTE_ADDR' => @ip }
    assert_equal 200, response.status
    assert_equal "#{@ip} Version One!", response.body
  end

  test '/v2 returns version 2' do
    get '/v2/zombies', {}, { 'REMOTE_ADDR' => @ip }
    assert_equal 200, response.status
    assert_equal "#{@ip} Version Two!", response.body
  end
end
