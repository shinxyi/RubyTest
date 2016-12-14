class EventsController < ApplicationController
  before_action :require_login

  def index
    @in_state_events= Event.where(state: current_user.state).where('date >= ?', today).includes(:host, :users).order(:date)
    @other_states_events= Event.where.not(state: current_user.state).where('date >= ?', today).includes(:host, :users).order(:date)
  end

  def create
    @user = User.find(current_user.id)
    @event = @user.events.create(event_params)
    if @event.errors.any?
      flash[:alert] = @event.errors.full_messages
      redirect_to '/events'
    else
      flash[:alert] = ['Event successfully added!']
      redirect_to '/events'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_to '/events'

  end

  private
    def event_params
      params.require(:event).permit(:name, :date, :city, :state)
    end

end
