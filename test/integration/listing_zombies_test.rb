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

=begin
describe "Listing Zombies" do

  describe "GET /zombies" do
    it "returns successful response" do
      get api_zombies_url
      expect(response.status).to be(200)
      expect(response).to be_success
      expect(response).to be_successful
      expect(response.body).to_not be_empty
    end

    context 'filtering by weapon' do

      it 'returns zombies with specified weapon' do
        john = Zombie.create!(name: 'John', weapon: 'axe')
        joanna = Zombie.create!(name: 'Joanna', weapon: 'shotgun')

        get api_zombies_url(weapon: 'axe')
        expect(response.status).to be(200)

        #zombies = JSON.parse(response.body, symbolize_names: true)
        zombies = json(response.body)
        names = zombies.collect { |z| z[:name] }
        expect(names).to include('John')
        expect(names).to_not include('Joanna')
      end

      it 'returns zombie from id' do
        zombie = Zombie.create!(name: 'Joanna', weapon: 'axe')
        get api_zombie_url(zombie)
        expect(response.status).to be(200)

        #zombie_response = JSON.parse(response.body, symbolize_names: true)
        zombie_response = json(response.body)
        expect(zombie_response[:name]).to eq(zombie.name)
      end
    end
  end
end
=end

