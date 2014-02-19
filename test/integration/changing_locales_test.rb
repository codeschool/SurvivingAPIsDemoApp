require 'test_helper'

class ChangingLocalesTest < ActionDispatch::IntegrationTest
  setup do
    Zombie.create!(name: 'Joanna', age: 251)
  end

  teardown do
    Zombie.destroy_all
  end

  test 'returns list of zombies in english using gem' do
    get '/zombies', {}, {'Accept-Language' => 'en', 'Accept' => Mime::JSON }
    assert 200, response.status
    zombies = json(response.body)
    assert_equal "Watch out for #{zombies[0][:name]}!", zombies[0][:message]
  end

  test 'return list of zombies in portuguese using gem' do
    get '/zombies', {}, { 'Accept-Language' => 'pt-BR', 'Accept' => Mime::JSON }
    assert 200, response.status
    zombies = json(response.body)
    assert_equal "Cuidado com #{zombies[0][:name]}!", zombies[0][:message]
  end
  
  test 'returns list of zombies in english not using gem' do
    get '/zombies/1', {}, {'Accept-Language' => 'en', 'Accept' => Mime::JSON }
    assert 200, response.status
    zombie = json(response.body)
    assert_equal "Watch out for #{zombie[:name]}!", zombie[:message]
  end
  
  test 'returns list of zombies in portuguese not using gem' do
    get '/zombies/1', {}, { 'Accept-Language' => 'pt-BR', 'Accept' => Mime::JSON }
    assert 200, response.status
    zombie = json(response.body)
    assert_equal "Cuidado com #{zombie[:name]}!", zombie[:message]    
  end
end
