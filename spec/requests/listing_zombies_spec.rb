require 'spec_helper'

describe 'Listing Zombies' do
  let(:joanna) { Zombie.create!(name: 'Joanna') }

  context 'for v1' do
    it 'lists zombies from v1' do
      get '/zombies', {}, { 'HTTP_ACCEPT' => 'application/vnd.apocalypse.v1+json' }
      expect(response.content_type).to eq(Mime::APOCALYPSE_V1.to_s)
      expect(response).to be_success

      get '/zombies', {}, { 'HTTP_ACCEPT' => Mime::APOCALYPSE_V1.to_s }
      expect(response.content_type).to eq(Mime::APOCALYPSE_V1.to_s)
      expect(response).to be_success
    end

    it 'finds a single zombie from v1' do
      get "/zombies/#{joanna.id}", {}, { 'HTTP_ACCEPT' => Mime::APOCALYPSE_V1.to_s }
      expect(response.content_type).to eq(Mime::APOCALYPSE_V1.to_s)
      expect(response).to be_success
    end
  end

  context 'for v2' do
    it 'lists zombies from v2' do
      get '/zombies', {}, { 'HTTP_ACCEPT' => Mime::APOCALYPSE_V2.to_s }
      expect(response.content_type).to eq(Mime::APOCALYPSE_V2.to_s)
      expect(response).to be_success
    end

    it 'finds a single zombie from v2' do
      get "/zombies/#{joanna.id}", {}, { 'HTTP_ACCEPT' => Mime::APOCALYPSE_V2.to_s }
      expect(response.content_type).to eq(Mime::APOCALYPSE_V2.to_s)
      expect(response).to be_success
    end
  end

  context 'no version' do
    it 'defaults to v2' do
      get "/zombies/#{joanna.id}", {}, {}
      expect(response.content_type).to eq(Mime::APOCALYPSE_V2.to_s)
      expect(response).to be_success
    end
  end
end
