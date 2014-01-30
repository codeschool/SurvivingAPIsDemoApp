require 'test_helper'

class ChangingLocalesTest < ActionDispatch::IntegrationTest
  setup do
    Zombie.create!(name: 'Joanna', age: 251)
  end

  teardown do
    Zombie.destroy_all
  end

  test 'returns list of zombies in english' do
    get '/zombies', {}, {'Accept-Language' => 'en', 'Accept' => Mime::JSON }
    assert 200, response.status
    zombies = json(response.body)
    assert_equal "Watch out for #{zombies[0][:name]}!", zombies[0][:message]
  end

  test 'return list of zombies in portuguese' do
    get '/zombies', {}, { 'Accept-Language' => 'pt-BR', 'Accept' => Mime::JSON }
    assert 200, response.status
    zombies = json(response.body)
    assert_equal "Cuidado com #{zombies[0][:name]}!", zombies[0][:message]
  end
end
