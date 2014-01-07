require 'spec_helper'

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

