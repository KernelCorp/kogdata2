class EventsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  layout Proc.new { current_user.is_a?(Customer) ? 'customer' : 'photographer' }

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

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
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
      params.require(:event).permit(:city, :date, :time, :event_type_id, :budget, :customer_id)
    end
end
