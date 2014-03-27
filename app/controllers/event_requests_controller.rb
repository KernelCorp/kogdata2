class EventRequestsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_event_request, only: [:show, :destroy]
  before_action :set_event
  authorize_resource
  respond_to :json

  # GET /eventRequest
  # GET /eventRequest.json
  def index
    if @event.nil?
      @event_requests = current_user.event_requests
    else
      @event_requests = @event.event_requests
    end
  end

  # GET /eventRequest/1
  # GET /eventRequest/1.json
  def show
  end

  # POST /eventRequest
  # POST /eventRequest.json
  def create
    @event_request = @event.event_requests.build photographer: current_user
    flash[:notice] = 'Event Request was successfully created.' if @event_request.save
    respond_with @event, @event_request
  end

  # DELETE /eventRequest/1
  # DELETE /eventRequest/1.json
  def destroy
    @event_request.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_request
      @event_request = EventRequest.find(params[:id])
    end

    def set_event
      @event = Event.find params[:event_id] unless params[:event_id].blank?
    end
end
