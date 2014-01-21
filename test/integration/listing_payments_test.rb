require 'test_helper'

class ListingPaymentsTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(email: 'foo@bar.com')
    @user.payments.create!(amount: 99.99)
  end

  teardown do
    User.destroy_all
  end

  test 'valid authentication' do
    get '/payments', {}, { 'USER_AUTH_TOKEN' => @user.auth_token }
    assert_equal 200, response.status
  end

  test 'invalid authentication' do
    get '/payments', {}, { 'USER_AUTH_TOKEN' => @user.auth_token + 'fake' }
    assert_equal 401, response.status
  end
end
