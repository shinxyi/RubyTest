class RostersController < ApplicationController
  before_action :require_login

  def create
    Roster.create(user: current_user, event: Event.find(params[:event_id]))
    redirect_to '/events'
  end

  def destroy
    Roster.find_by(user: current_user, event: Event.find(params[:event_id])).destroy
    redirect_to '/events'
  end
end
