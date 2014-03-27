require 'spec_helper'

describe MessagesController do

  # This should return the minimal set of attributes required to create a valid
  # Message. As you add validations to Message, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "text" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MessagesController. Be sure to keep this updated too.
  before(:each) do
    @sender = FactoryGirl.create :user, email: 'sender@example.com'
    @user   = FactoryGirl.create :user
    @conversation = @sender.conversations.create! users: [@user, @sender]
    request.accept = 'application/json'
  end

  describe "GET index" do
    it "assigns all messages as @messages in conversation" do
      sign_in @sender
      message = @conversation.messages.create! valid_attributes
      get :index, {conversation_id: @conversation.id}
      assigns(:messages).should eq([message])
    end
  end

  describe "GET show" do
    it "assigns the requested message as @message" do
      sign_in @sender
      message = @conversation.messages.create! valid_attributes
      get :show, {conversation_id: @conversation.id, id: message.to_param}
      assigns(:message).should eq(message)
    end
    it 'only member can see message' do
      sign_in FactoryGirl.create(:user, email: 'any@example.com')
      message = @conversation.messages.create! valid_attributes
      expect { get :show, {conversation_id: @conversation.id, 
                           id: message.to_param} }.to raise_error(CanCan::AccessDenied)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Message" do
        sign_in @sender
        expect {
          post :create, {conversation_id: @conversation.id, message: valid_attributes}
        }.to change { @conversation.reload.messages.count }.by(1)
      end

      it "assigns a newly created message as @message" do
        sign_in @sender
        post :create, {conversation_id: @conversation.id, message: valid_attributes}
        assigns(:message).should be_a(Message)
      end
      
      it 'only members can create message' do
        sign_in FactoryGirl.create(:user)
        expect {post :create, {conversation_id: @conversation.id, 
                               message: valid_attributes}}.to raise_error(CanCan::AccessDenied)
        
      end
    end

    describe "with invalid params" do
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested message" do
        sign_in @sender
        message = @conversation.messages.create! valid_attributes
        # Assuming there are no other messages in the database, this
        # specifies that the Message created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Message.any_instance.should_receive(:update).with({ "text" => "MyString123" })
        put :update, {conversation_id: @conversation.id, id: message.to_param, :message => { "text" => "MyString123" }}
      end

      it "assigns the requested message as @message" do
        sign_in @sender
        message = @conversation.messages.create! valid_attributes
        put :update, {id: message.to_param, conversation_id: @conversation.id, message: valid_attributes}
        assigns(:message).should eq(message)
      end

    end

    describe "with invalid params" do

    end
  end

  describe "DELETE destroy" do
    it "destroys the requested message" do
      sign_in @sender
      message = @conversation.messages.create! valid_attributes
      expect {
        delete :destroy, {conversation_id: @conversation.id, id: message.to_param}
      }.to change{ @conversation.reload.messages.count }.by(-1)
    end
  end

end
