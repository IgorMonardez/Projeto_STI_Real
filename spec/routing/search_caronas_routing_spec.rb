require "rails_helper"

RSpec.describe SearchCaronasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/search_caronas").to route_to("search_caronas#index")
    end

    it "routes to #new" do
      expect(get: "/search_caronas/new").to route_to("search_caronas#new")
    end

    it "routes to #show" do
      expect(get: "/search_caronas/1").to route_to("search_caronas#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/search_caronas/1/edit").to route_to("search_caronas#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/search_caronas").to route_to("search_caronas#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/search_caronas/1").to route_to("search_caronas#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/search_caronas/1").to route_to("search_caronas#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/search_caronas/1").to route_to("search_caronas#destroy", id: "1")
    end
  end
end
