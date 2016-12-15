class SessionsController < ApplicationController
  before_action :require_login, only: [:destroy]

  def index
    if current_user
      redirect_to "/dashboard/#{current_user.id}"
    end
  end

  def create
    @user = User.find_by(email: login_params[:email])
    if @user && @user.authenticate(login_params[:password])
      session[:user_id] = @user.id
      redirect_to "/dashboard/#{@user.id}"
    else
      flash[:login_errors] = ["Invalid email and password combination."]
      redirect_to '/main'
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to '/main'
  end

  private
    def login_params
      params.require(:login).permit(:email, :password)
    end

end
