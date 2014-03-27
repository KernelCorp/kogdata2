class EventsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  authorize_resource
  #layout Proc.new { current_user.is_a?(Customer) ? 'customer' : 'photographer' }
  respond_to :json, except: [ :edit, :new ]
  # GET /events
  # GET /events.json
  def index
    if params[:user_id].blank?
      @events = Event.active
    else
      @events = User.find(params[:user_id]).events
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = current_user.events.build
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = current_user.events.build event_params
    flash[:notice] = 'Event was successfully created.' if @event.save
    respond_with @event
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    flash[:notice] = 'Event was successfully updated.' if @event.update(event_params)
    respond_with @event
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      event = params[:event]
      if event[:date].blank? && !(event[:year].blank?  ||
                                  event[:month].blank? ||
                                  event[:day].blank?   ||
                                  event[:hour].blank?  ||
                                  event[:minute].blank?)
        params[:event][:date] = DateTime.new event[:year].to_i,
                                             event[:month].to_i,
                                             event[:day].to_i,
                                             event[:hour].to_i,
                                             event[:minute].to_i
      end
      params.require(:event).permit :city, :date, :time, :event_type_id, :budget, :customer_id
    end
end
