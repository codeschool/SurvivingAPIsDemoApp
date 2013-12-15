require 'spec_helper'

describe "Listing Zombies" do

  describe "GET /zombies" do
    it "returns successful response" do
      get api_zombies_url
      expect(response.status).to be(200)
    end

    context 'filtering by weapon' do
      before do
        @john = Zombie.create!(name: 'John', weapon: 'axe')
        @joanna = Zombie.create!(name: 'Joanna', weapon: 'shotgun')
      end

      it 'returns zombies with specified weapon' do
        get api_zombies_url(weapon: 'axe')
        expect(response.status).to be(200)

        zombies = JSON.parse(response.body, symbolize_names: true)
        names = zombies.collect { |z| z[:name] }
        expect(names).to include('John')
        expect(names).to_not include('Joanna')
      end
    end
  end

end

