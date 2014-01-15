require 'spec_helper'

describe 'Changing versions spec' do
  context 'for version 1' do
    it { expect(get: '/v1/zombies').to route_to(controller: 'api/v1/zombies', action: 'index') }
  end

  context 'for version 2' do
    it { expect(get: '/v2/zombies').to route_to(controller: 'api/v2/zombies', action: 'index') }
  end
end
