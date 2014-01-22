require 'test_helper'

class ListingPaymentsTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(username: 'foo',
                         password: 'secret', password_confirmation: 'secret')
    @user.payments.create!(amount: 99.99)
  end

  teardown do
    User.destroy_all
  end

  def encode(username, password)
    ActionController::HttpAuthentication::Basic.encode_credentials(username, password)
  end

  test 'valid username and password' do
    get '/payments', {}, { 'Authorization' => encode(@user.username, @user.password) }
    assert_equal 200, response.status
  end

  test 'missing credentials' do
    get '/payments', {}, {}
    assert_equal 401, response.status
  end

  test 'invalid username' do
    get '/payments', {}, { 'Authorization' => encode('', @user.password) }
    assert_equal 401, response.status
  end

  test 'invalid password' do
    get '/payments', {}, { 'Authorization' => encode(@user.username, '') }
    assert_equal 401, response.status
  end
end
