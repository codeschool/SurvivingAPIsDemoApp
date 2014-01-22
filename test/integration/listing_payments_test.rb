require 'test_helper'

class ListingPaymentsTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(email: 'foo@bar.com')
    @user.payments.create!(amount: 99.99)
    @auth_header = "Token token=#{@user.auth_token}"
    @token = ActionController::HttpAuthentication::Token.encode_credentials(@user.auth_token)
  end

  teardown do
    User.destroy_all
  end

  # Show this example first
  test 'valid authentication with manual token' do
    get '/payments', {}, { 'Authorization' => @auth_header }
    assert_equal 200, response.status
  end

  # Show this after showing the #encode_credentials method
  test 'valid authentication' do
    get '/payments', {}, { 'Authorization' => @token }
    assert_equal 200, response.status
  end


  test 'invalid authentication' do
    get '/payments', {}, { 'Authorization' => @token + 'fake' }
    assert_equal 401, response.status
  end
end
