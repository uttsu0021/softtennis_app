class EntriesController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @entry = Entry.new
  end

  def create
    @event = Event.find(params[:event_id])
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:last_name, :first_name, :last_name_kata, :first_name_kata, :postal_code, :address, :phone, :group, :record).merge(user_id: current_user.id, event_id: params[:event_id])
  end
end
