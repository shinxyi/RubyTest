class SessionsController < ApplicationController
  def index
    # if current_user
    #   redirect_to "/events"
    # end
  end

  def create
    @user = User.find_by(email: login_params[:email])
    if @user && @user.authenticate(login_params[:password])
      session[:user_id] = @user.id
      redirect_to "/events"
    else
      flash[:login_errors] = ["Invalid email and password combination."]
      redirect_to '/'
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  private
    def login_params
      params.require(:login).permit(:email, :password)
    end

end
