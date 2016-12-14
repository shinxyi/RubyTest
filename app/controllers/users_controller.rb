class UsersController < ApplicationController
  before_action :require_login, except: [:create]

  def create
    @user = User.create(user_params)
    if @user.errors.any?
      flash[:reg_errors] = @user.errors.full_messages
      redirect_to '/'
    else
      session[:user_id] = @user.id
      redirect_to '/events'
    end
  end

  def edit
  end

  def update
    @user = User.find(current_user.id)
    success = @user.update(user_params)
    if !success
      flash[:alert] = "Fileds are invalid."
    else
      flash[:alert] = "Changes successfully made."
    end
    puts @user.errors.inspect
    redirect_to "/users/#{current_user.id}/edit"

  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
  end

end
