require 'test_helper'

class ListingEpisodesTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(email: 'foo@bar.com')
    @auth_header = "Token token=#{@user.auth_token}"
    @token = ActionController::HttpAuthentication::Token.encode_credentials(@user.auth_token)
  end

  teardown do
    User.destroy_all
  end

  # Show this example first
  test 'valid authentication with manual token' do
    get '/episodes', {}, { 'Accept' => Mime::JSON, 'Authorization' => @auth_header }
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
  end

  # Show this after showing the #encode_credentials method
  test 'valid authentication' do
    get '/episodes', {}, { 'Authorization' => @token }
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
  end


  test 'invalid authentication' do
    get '/episodes', {}, { 'Authorization' => @token + 'fake' }
    assert_equal 401, response.status
    #assert_equal Mime::JSON, response.content_type :(
  end
end
