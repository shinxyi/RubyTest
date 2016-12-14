class UsersController < ApplicationController
  # before_action :require_login, except: [:create]

  def dashboard
    #users you've connected with
    connections = Network.where(user: current_user, accepted_invite: true).pluck('associate_id')
    connections += Network.where(associate: current_user, accepted_invite: true).pluck('user_id')
    @user_network = User.where(id: connections)
    #someone's invited you to be connected but you haven't accepted yet
    @user_invite = Network.where(associate: current_user, accepted_invite: false).includes(:user)
  end

  def index
    #only pull all the users who are not associated to current_user
    connections = Network.where(associate: current_user).pluck('user_id')
    connections += Network.where(user: current_user).pluck('associate_id')
    connections.push(current_user.id)
    @users = User.where.not(id: connections)
    #1. looking for users who aren't associated with me (either we've already accepted cxn or there's a pending
    #   cxn made by that user to me)
    #2. not me
    #3. users who I haven't already invited to connect
  end

  def create
    @user = User.create(user_params)
    if @user.errors.any?
      flash[:reg_errors] = @user.errors.full_messages
      redirect_to '/'
    else
      session[:user_id] = @user.id
      redirect_to '/professional_profile'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :birthday,:description, :password, :password_confirmation)
  end

end
