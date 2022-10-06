class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :redirecto_root, only: [:edit, :update, :destroy]
  def index
    @events = Event.order('created_at DESC')
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
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event.id)
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to root_path
  end


  private

  def event_params
    params.require(:event).permit(:image,:event,:category,:date,:prefectures,:venue,:fee,:deadline,:explanation,).merge(user_id: current_user.id)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def redirecto_root
    redirect_to root_path if current_user != @event.user
  end
end