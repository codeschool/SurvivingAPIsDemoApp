require 'test_helper'

class ListingPaymentsTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(username: 'foo',
                         password: 'secret', password_confirmation: 'secret')
  end

  teardown { User.destroy_all }

  def encode(username, password)
    ActionController::HttpAuthentication::Basic.encode_credentials(username, password)
  end

  test 'valid username and password' do
    get '/episodes', {}, { 'Authorization' => encode(@user.username, @user.password) }
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
  end

  test 'missing credentials' do
    get '/episodes', {}, {}
    assert_equal 401, response.status
    assert_equal Mime::HTML, response.content_type
  end

  test 'invalid username' do
    get '/episodes', {}, { 'Authorization' => encode('', @user.password) }
    assert_equal 401, response.status
    assert_equal Mime::HTML, response.content_type
  end

  test 'invalid access sets WWW-Authenticate to Application realm' do
    get '/episodes', {}, { 'Authorization' => encode('', @user.password) }
    assert_equal 401, response.status
    assert_equal 'Basic realm="Application"', response.headers['WWW-Authenticate']
  end

  test 'invalid password' do
    get '/episodes', {}, { 'Authorization' => encode(@user.username, '') }
    assert_equal 401, response.status
    assert_equal Mime::HTML, response.content_type
  end

  test 'invalid password manual content type' do
    get '/episodes/1', {}, { 'Authorization' => encode(@user.username, '') }
    assert_equal 401, response.status
    assert_equal Mime::JSON, response.content_type
  end

  test 'invalid access sets WWW-Authenticate to Preview realm' do
    get '/episodes/preview', {}, { 'Authorization' => encode('', @user.password) }
    assert_equal 401, response.status
    assert_equal 'Basic realm="Preview"', response.headers['WWW-Authenticate']
  end

  test 'invalid access sets WWW-Authenticate to Banana realm' do
    get '/episodes/1/edit', {}, { 'Authorization' => encode('', @user.password) }
    assert_equal 401, response.status
    assert_equal 'Basic realm="Banana"', response.headers['WWW-Authenticate']
  end
end
