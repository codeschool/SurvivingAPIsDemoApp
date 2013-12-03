require "spec_helper"

describe EpisodesController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/episodes").to route_to("episodes#index")
    end

    it "routes to #new" do
      expect(:get => "/episodes/new").to route_to("episodes#new")
    end

    it "routes to #show" do
      expect(:get => "/episodes/1").to route_to("episodes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/episodes/1/edit").to route_to("episodes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/episodes").to route_to("episodes#create")
    end

    it "routes to #update" do
      expect(:put => "/episodes/1").to route_to("episodes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/episodes/1").to route_to("episodes#destroy", :id => "1")
    end

  end
end
