require 'test_helper'

class ListingZombies < ActionDispatch::IntegrationTest
  setup do
    host! 'api.example.com'
  end

  test 'returns list of all zombies' do
    get '/zombies'
    assert_equal 200, response.status
    assert response.success?
    assert response.successful?
    refute_empty response.body
  end

  test 'returns zombies filtered by weapon' do
    john = Zombie.create!(name: 'John', weapon: 'axe')
    joanna = Zombie.create!(name: 'Joanna', weapon: 'shotgun')

    get '/zombies?weapon=axe'
    assert response.success?

    zombies = json(response.body)
    names = zombies.collect { |z| z[:name] }
    assert_includes names, 'John'
    refute_includes names, 'Joanna'
  end

  test 'returns zombie by id' do
    zombie = Zombie.create!(name: 'Joanna', weapon: 'axe')
    get "/zombies/#{zombie.id}"
    assert response.success?

    zombie_response = json(response.body)
    assert_equal zombie.name, zombie_response[:name]
  end
end

