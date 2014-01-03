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

describe ConversationsController do

  # This should return the minimal set of attributes required to create a valid
  # Conversation. As you add validations to Conversation, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "theme" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ConversationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all conversations as @conversations" do
      conversation = Conversation.create! valid_attributes
      get :index, {}, valid_session
      assigns(:conversations).should eq([conversation])
    end
  end

  describe "GET show" do
    it "assigns the requested conversation as @conversation" do
      conversation = Conversation.create! valid_attributes
      get :show, {:id => conversation.to_param}, valid_session
      assigns(:conversation).should eq(conversation)
    end
  end

  describe "GET new" do
    it "assigns a new conversation as @conversation" do
      get :new, {}, valid_session
      assigns(:conversation).should be_a_new(Conversation)
    end
  end

  describe "GET edit" do
    it "assigns the requested conversation as @conversation" do
      conversation = Conversation.create! valid_attributes
      get :edit, {:id => conversation.to_param}, valid_session
      assigns(:conversation).should eq(conversation)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Conversation" do
        expect {
          post :create, {:conversation => valid_attributes}, valid_session
        }.to change(Conversation, :count).by(1)
      end

      it "assigns a newly created conversation as @conversation" do
        post :create, {:conversation => valid_attributes}, valid_session
        assigns(:conversation).should be_a(Conversation)
        assigns(:conversation).should be_persisted
      end

      it "redirects to the created conversation" do
        post :create, {:conversation => valid_attributes}, valid_session
        response.should redirect_to(Conversation.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved conversation as @conversation" do
        # Trigger the behavior that occurs when invalid params are submitted
        Conversation.any_instance.stub(:save).and_return(false)
        post :create, {:conversation => { "theme" => "invalid value" }}, valid_session
        assigns(:conversation).should be_a_new(Conversation)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Conversation.any_instance.stub(:save).and_return(false)
        post :create, {:conversation => { "theme" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested conversation" do
        conversation = Conversation.create! valid_attributes
        # Assuming there are no other conversations in the database, this
        # specifies that the Conversation created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Conversation.any_instance.should_receive(:update).with({ "theme" => "MyString" })
        put :update, {:id => conversation.to_param, :conversation => { "theme" => "MyString" }}, valid_session
      end

      it "assigns the requested conversation as @conversation" do
        conversation = Conversation.create! valid_attributes
        put :update, {:id => conversation.to_param, :conversation => valid_attributes}, valid_session
        assigns(:conversation).should eq(conversation)
      end

      it "redirects to the conversation" do
        conversation = Conversation.create! valid_attributes
        put :update, {:id => conversation.to_param, :conversation => valid_attributes}, valid_session
        response.should redirect_to(conversation)
      end
    end

    describe "with invalid params" do
      it "assigns the conversation as @conversation" do
        conversation = Conversation.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Conversation.any_instance.stub(:save).and_return(false)
        put :update, {:id => conversation.to_param, :conversation => { "theme" => "invalid value" }}, valid_session
        assigns(:conversation).should eq(conversation)
      end

      it "re-renders the 'edit' template" do
        conversation = Conversation.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Conversation.any_instance.stub(:save).and_return(false)
        put :update, {:id => conversation.to_param, :conversation => { "theme" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested conversation" do
      conversation = Conversation.create! valid_attributes
      expect {
        delete :destroy, {:id => conversation.to_param}, valid_session
      }.to change(Conversation, :count).by(-1)
    end

    it "redirects to the conversations list" do
      conversation = Conversation.create! valid_attributes
      delete :destroy, {:id => conversation.to_param}, valid_session
      response.should redirect_to(conversations_url)
    end
  end

end
