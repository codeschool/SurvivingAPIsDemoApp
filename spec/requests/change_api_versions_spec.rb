require 'spec_helper'

describe 'Listing Zombies' do
  let(:ip) { '123.123.123.123' }

  context 'using V1' do
    it 'returns version one' do
      get '/zombies', {}, { 'REMOTE_ADDR' => ip, 'HTTP_ACCEPT' => 'application/vnd.apocalypse.v1+json' }
      expect(response).to be_success
      expect(response.body).to eq("#{ip} Version One!")
      expect(response.content_type).to eq(Mime::JSON)
    end
  end

  context 'using V2' do
    it 'returns version two' do
      get '/zombies', {}, { 'REMOTE_ADDR' => ip, 'HTTP_ACCEPT' => 'application/vnd.apocalypse.v2+json' }
      expect(response).to be_success
      expect(response.body).to eq("#{ip} Version Two!")
      expect(response.content_type).to eq(Mime::JSON)
    end
  end
end
