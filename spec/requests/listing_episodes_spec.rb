require 'spec_helper'

describe 'Listing episodes' do

  it 'returns episodes with 200 status' do

=begin
    # WORKS, but using the Mime Type as extension should be avoided.
    post '/episodes.json',
      episode: { title: 'Bananas', description: 'Learn about bananas.' }
=end

=begin
    # WORKS, but hardcoding URI on tests should be avoided.
    post '/episodes',
      episode: { title: 'Bananas', description: 'Learn about bananas.' }, format: 'json'
=end

    # WORKS and it's what I would typically do.
    #post episodes_url,
      #episode: { title: 'Bananas', description: 'Learn about bananas.' }, format: 'json'

=begin
    # WORKS, and it's an alternative to using format: 'json'
    #post episodes_url,
      #{ episode: { title: 'Bananas', description: 'Learn about bananas.' }},
      #{ 'HTTP_ACCEPT' => 'application/json' }
=end

    # WORKS, and it's an alternative to hardcoding 'json'
    get episodes_url, {}, { 'HTTP_ACCEPT' => Mime::JSON.to_s }

    # This fails initially if JSON format not specified.
    # expect(response).to be_success

    # https://github.com/rails/rails/blob/master/actionpack/lib/action_dispatch/testing/test_response.rb#L18
    # success? is an alias added to Rack::Response::Helpers' successful?
    # https://github.com/rack/rack/blob/master/lib/rack/response.rb#L115-L131
    # A successful response is anything >= 200 and < 300
    expect(response).to be_success
    expect(response).to be_successful

    # However.. we should to be a little more specific on what 'success' means.
    expect(response.status).to eq(200)
    expect(response.content_type).to eq(Mime::JSON) # the Mime Type of the response body.
    # Totally unnecessary. Just to show that a valid resource representation is returned in the message body.
  end

  it 'apocalpyse' do
=begin
    get episodes_url, {},
      { 'ACCEPT' => 'application/vnd.apocalypse+json', 'App-Key' => '123123' }

    expect(response.status).to eq(201) # proper code that indicates a new resource was created.
    expect(response.content_type).to eq('application/vnd.apocalypse+json')

    post episodes_url,
      { episode: { title: 'Bananasssss', description: 'Learn about bananas.' }},
      { 'HTTP_ACCEPT' => Mime::APOCALYPSE }

    expect(response.status).to eq(201) # proper code that indicates a new resource was created.
    expect(response.content_type).to eq(Mime::APOCALYPSE)

    post episodes_url,
      { episode: { title: 'Bananasssss', description: 'Learn about bananas.' }},
      { 'HTTP_ACCEPT' => Mime::APOCALYPSE }

    expect(response.status).to eq(201) # proper code that indicates a new resource was created.
    expect(response.content_type).to eq(Mime::APOCALYPSE)

    post episodes_url,
      { episode: { title: 'Bananasssss', description: 'Learn about bananas.' }}.to_json,
      { 'HTTP_ACCEPT' => Mime::APOCALYPSE , 'CONTENT_TYPE' => Mime::JSON.to_s }

    post episodes_url,
      { episode: { title: 'Bananasssss', description: 'Learn about bananas.' }}.to_json,
      { 'HTTP_ACCEPT' => Mime::APOCALYPSE , 'CONTENT_TYPE' => Mime::APOCALYPSE.to_s }

    expect(response.status).to eq(201) # proper code that indicates a new resource was created.
    expect(response.content_type).to eq(Mime::APOCALYPSE)
=end
    get episodes_url, {}, { 'ACCEPT' => Mime::APOCALYPSE }
    expect(response.status).to eq(200)
    expect(response.content_type).to eq(Mime::APOCALYPSE)

    get episodes_url, {}, { 'ACCEPT' => 'application/vnd.apocalypse+json' }
    expect(response.status).to eq(200)
    expect(response.content_type).to eq(Mime::APOCALYPSE)
  end
end
