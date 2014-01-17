require 'spec_helper'

describe 'Changing versions spec' do
  context 'the default version' do
    it { expect(get: '/zombies').to route_to(controller: 'api/v2/zombies', action: 'index', format: 'json') }
  end
end
