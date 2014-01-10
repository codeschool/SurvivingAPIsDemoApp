require 'spec_helper'

describe "Changing Locales" do
  before(:all) do
    Zombie.create!(name: 'John')
    Zombie.create!(name: 'Joanna')
  end

  after(:all) do
    Zombie.destroy_all
  end

  context 'with locale in pt-BR' do
    it 'returns warning message in portuguese' do
      get zombies_url, {}, {'HTTP_ACCEPT_LANGUAGE' => 'pt-BR', 'HTTP_ACCEPT' => Mime::JSON }
      expect(response).to be_successful
      zombies = JSON.parse(response.body, symbolize_names: true)
      expect(zombies[0][:warning_message]).to eq("Cuidado com #{zombies[0][:name]}!")
    end
  end

  context 'with locale in en' do
    it 'returns warning message in english' do
      get zombies_url, {}, {'HTTP_ACCEPT_LANGUAGE' => 'en', 'HTTP_ACCEPT' => Mime::JSON }
      expect(response).to be_successful
      zombies = JSON.parse(response.body, symbolize_names: true)
      expect(zombies[0][:warning_message]).to eq("Watch out for #{zombies[0][:name]}!")
    end
  end
end
