require 'spec_helper'

describe "ListingZombies" do

  describe "GET /listing_zombies" do
    it "works! (now write some real specs)" do
      get api_zombies_url
      expect(response.status).to be(200)
    end
  end

end

