require 'spec_helper'

describe 'Creating episodes' do

  it 'returns 201 status code' do
    post episodes_path,
      episode: { title: 'Bananas', description: 'Learn about bananas.' },
      format: 'json'

    # This fails initially if JSON format not specified.
    # expect(response).to be_success

    # https://github.com/rails/rails/blob/master/actionpack/lib/action_dispatch/testing/test_response.rb#L18
    # success? is an alias added to Rack::Response::Helpers' successful?
    # https://github.com/rack/rack/blob/master/lib/rack/response.rb#L115-L131
    # A successful response is anything >= 200 and < 300
    expect(response).to be_success
    expect(response).to be_successful

    # However.. we need to be a little more specific.
    expect(response.status).to eq(201)
    expect(response.header['Location']).to eq(episode_url(Episode.last))
    expect(response.content_type).to eq(Mime::JSON)
    # Totally unnecessary. Just to show that a valid resource representation is returned in the message body.
    expect(Episode.new(JSON.parse(response.body))).to be_valid
  end
end
