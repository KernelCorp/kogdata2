require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe EventRequestsController do

  describe 'with event request' do

    before :each do
      @event_request = FactoryGirl.create :event_request
    end
    
    describe "GET index" do
      it "assigns all eventRequest as @eventRequest" do
        sign_in @event_request.event.customer
        get :index, {event_id: @event_request.event.id}
        assigns(:event_requests).should eq([@event_request])
      end

      it 'photographer can not see list of requests' do
        sign_in @event_request.photographer
        expect {get :index, {event_id: @event_request.event.id}}.to raise_error(CanCan::AccessDenied)
      end
    end
  
    describe "GET show" do
      it "assigns the requested event_request as @event_request" do
        sign_in @event_request.photographer
        get :show, {event_id: @event_request.event.id, :id => @event_request.to_param}
        assigns(:event_request).should eq(@event_request)
      end
    end
  
    describe "DELETE destroy" do
      it "destroys the requested event_request" do
        sign_in @event_request.photographer
        expect {
          delete :destroy, {event_id: @event_request.event.id, :id => @event_request.to_param}
        }.to change(EventRequest, :count).by(-1)
      end
    end
  end

  describe "GET new" do
    it "assigns a new event_request as @event_request" do
      sign_in FactoryGirl.create :photographer
      get :new, {event_id: FactoryGirl.create(:event).id}
      assigns(:event_request).should be_a_new(EventRequest)
    end
  end
  
  describe "POST create" do
    describe "with valid params" do
      it "creates a new EventRequest" do
        sign_in FactoryGirl.create :photographer
        expect {
          post :create, {event_id: FactoryGirl.create(:event).id}
        }.to change(EventRequest, :count).by(1)
      end

      it "assigns a newly created event_request as @event_request" do
        user  = FactoryGirl.create :photographer
        event = FactoryGirl.create :event
        sign_in user
        post :create, {event_id: event.id}
        assigns(:event_request).should be_a(EventRequest)
        assigns(:event_request).should be_persisted
        assigns(:event_request).event.should eq(event)
        assigns(:event_request).photographer.should eq(user)
      end
    end
  end
end
