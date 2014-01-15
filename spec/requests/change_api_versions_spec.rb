require 'spec_helper'

describe 'Listing Zombies' do
  let(:ip) { '123.123.123.123' }

  context 'using V1' do
    it 'returns version one' do
      get '/v1/zombies', {}, { 'REMOTE_ADDR' => ip }
      expect(response).to be_success
      expect(response.body).to eq("#{ip} Version One!")
    end
  end

  context 'using V2' do
    it 'returns version two' do
      get '/v2/zombies', {}, { 'REMOTE_ADDR' => ip }
      expect(response).to be_success
      expect(response.body).to eq("#{ip} Version Two!")
    end
  end
end
