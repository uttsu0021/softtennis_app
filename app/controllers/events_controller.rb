class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @events = Event.new
  end

  def create
    @events = Event.create(event_params)
    if @events.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end
  private

  def event_params
    params.require(:event).permit(:image,:event,:category,:date,:prefectures,:venue,:fee,:deadline,:explanation,).merge(user_id: current_user.id)
  end
end