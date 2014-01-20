require 'test_helper'

class DeletingEpisodesTest < ActionDispatch::IntegrationTest
  setup do
    @episode = Episode.create(title: 'I am going to be deleted')
  end

  test 'deletes existing episode' do
    delete "/episodes/#{@episode.id}"
    assert_equal 204, response.status
  end
end
