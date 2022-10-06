class EntriesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_event, only: [:index, :create]
  before_action :redirect_root, only: [:index, :create]
  def index
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:last_name, :first_name, :last_name_kata, :first_name_kata, :postal_code, :address, :phone, :group, :battle_record).merge(user_id: current_user.id, event_id: params[:event_id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def redirect_root
    redirect_to root_path if current_user == @event.user
  end
end
