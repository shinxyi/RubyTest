class CommentsController < ApplicationController
  before_action :require_login

  def create
    @comment = Comment.create(comment: params[:comment]['comment'], user: current_user, event: Event.find(params[:comment]['event_id']))
    if @comment.errors.any?
      flash[:errors] = @comment.errors.full_messages
      redirect_to "/events/#{params[:comment]['event_id']}"
    else
      redirect_to "/events/#{params[:comment]['event_id']}"
    end

  end

end
