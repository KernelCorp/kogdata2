require "spec_helper"

describe EventRequestsController do
  describe "routing" do

    it "routes to #index" do
      get("/event_requests").should route_to("event_requests#index")
    end

    it "routes to #new" do
      get("/event_requests/new").should route_to("event_requests#new")
    end

    it "routes to #show" do
      get("/event_requests/1").should route_to("event_requests#show", :id => "1")
    end

    it "routes to #edit" do
      get("/event_requests/1/edit").should route_to("event_requests#edit", :id => "1")
    end

    it "routes to #create" do
      post("/event_requests").should route_to("event_requests#create")
    end

    it "routes to #update" do
      put("/event_requests/1").should route_to("event_requests#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/event_requests/1").should route_to("event_requests#destroy", :id => "1")
    end

  end
end
