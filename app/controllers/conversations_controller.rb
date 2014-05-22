class ConversationsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]
  authorize_resource
  respond_to :json

  # GET /conversations
  # GET /conversations.json
  def index
    @conversations = current_user.conversations
  end

  def show
  end

  # POST /conversations
  # POST /conversations.json
  def create
    @conversation = current_user.conversations.build
    flash[:notice] = 'Conversation was successfully created.' if @conversation.save
    respond_with @conversation
  end

  def create_with_user
    @conversation = current_user.conversations.build
    @conversation.users.push User.find params[:user_id]
    @conversation.save
    respond_with conversation_path(@conversation)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conversation_params
      params.require(:conversation).permit :theme
    end

    def conversation_url(conversation); conversation_messages_url(conversation) end
end
