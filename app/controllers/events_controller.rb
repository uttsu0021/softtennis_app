class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @events = Event.new
  end

  private

  def event_params
    params.require(:event).permit(:image)
  end
end
