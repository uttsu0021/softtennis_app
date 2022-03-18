class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @events = Event.new
  end

  def create
    Event.create(event_params)
  end
  private

  def event_params
    params.require(:event).permit(:image,:event,:category,:date,:prefectures,:venue,:fee,:deadline,:explanation,).marge(user_id: current_user.id)
  end
end