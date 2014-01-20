require 'test_helper'

class RoutesTest < ActionDispatch::IntegrationTest
  test 'routes version' do
    assert_generates '/v1/zombies', { controller: 'api/v1/zombies', action: 'index' }
    assert_generates '/v2/zombies', { controller: 'api/v2/zombies', action: 'index' }
  end
end
