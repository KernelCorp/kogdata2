class MessagesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_conversation
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  respond_to :json
  authorize_resource

  # GET /messages
  # GET /messages.json
  def index
    @messages = @conversation.messages
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = @conversation.messages.build message_params
    @message.user = current_user
    authorize! :create, @message
    flash[:notice] = 'Message was successfully saved.' if @message.save(message_params)
    
    respond_to do |format|
      format.json { render :show }
      format.html { respond_with @conversation, @message }
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    flash[:notice] = 'Message was successfully updated.' if @message.update(message_params)
    respond_with @message
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = @conversation.messages.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:text, :user_id)
    end

    def set_conversation
      @conversation = Conversation.find params[:conversation_id]
    end
end
