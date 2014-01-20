require 'test_helper'

class UpdatingEpisodesTest < ActionDispatch::IntegrationTest
  setup do
    @episode = Episode.create!(title: 'First Title')
  end

  test 'successful update' do
    patch "/episodes/#{@episode.id}",
      { episode: { title: 'First Title Edit' } }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_equal 200, response.status
    assert_equal 'First Title Edit', @episode.reload.title
  end

  test 'unsuccessful update' do
    patch "/episodes/#{@episode.id}",
      { episode: { title: 'short' } }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_equal 422, response.status
  end
end
