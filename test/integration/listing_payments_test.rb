require 'test_helper'

class ListingPaymentsTest < ActionDispatch::IntegrationTest
  setup do
    password = 'secret'
    @user = User.create!(username: 'foobar',
                         password: password, password_confirmation: password)
    @user.payments.create!(amount: 99.99)
  end

  teardown do
    User.destroy_all
  end

  test 'valid username and password' do
    auth = ActionController::HttpAuthentication::Basic.encode_credentials(@user.username, @user.password)
    get '/payments', {}, { 'Authorization' =>  auth }
    assert_equal 200, response.status
  end

  test 'missing credentials' do
    get '/payments', {}, {}
    assert_equal 401, response.status
  end

  test 'invalid username' do
    auth = ActionController::HttpAuthentication::Basic.encode_credentials('', @user.password)
    get '/payments', {}, { 'Authorization' =>  auth }
    assert_equal 401, response.status
  end

  test 'invalid password' do
    auth = ActionController::HttpAuthentication::Basic.encode_credentials(@user.username, '')
    get '/payments', {}, { 'Authorization' =>  auth }
    assert_equal 401, response.status
  end
end
