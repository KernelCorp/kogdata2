class EventRequestsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_event_request, only: [:show, :destroy]
  before_action :set_event
  load_and_authorize_resource

  # GET /event_requests
  # GET /event_requests.json
  def index
    @event_requests = EventRequest.all
  end

  # GET /event_requests/1
  # GET /event_requests/1.json
  def show
  end

  # GET /event_requests/new
  def new
    @event_request = @event.event_requests.build
  end

  # POST /event_requests
  # POST /event_requests.json
  def create
    @event_request = @event.event_requests.build photographer: current_user

    respond_to do |format|
      if @event_request.save
        format.html { redirect_to event_event_request_path(@event, @event_request),
                                  notice: 'Event request was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event_request }
      else
        format.html { render action: 'new' }
        format.json { render json: @event_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_requests/1
  # DELETE /event_requests/1.json
  def destroy
    @event_request.destroy
    respond_to do |format|
      format.html { redirect_to event_event_requests_url }
      format.json { head :no_content }
    end
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
