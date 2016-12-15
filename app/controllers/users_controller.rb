class UsersController < ApplicationController
  before_action :require_login, only: [:dashboard]
  before_action :require_correct_user, only: [:dashboard]

  def create
    @user = User.create(user_params)
    if @user.errors.any?
      flash[:reg_errors] = @user.errors.full_messages
      redirect_to '/main'
    else
      session[:user_id] = @user.id
      redirect_to "/dashboard/#{@user.id}"
    end
  end

  def dashboard
    my_shoes = current_user.shoes

    @sales = Purchase.where(shoe: my_shoes).includes(:user, :shoe)
    sold = @sales.pluck('shoe_id')
    @total_sales = @sales.pluck('price').inject(0){ |sum, x| sum + x}

    @on_sale = my_shoes.where.not(id: sold)

    @purchases = Purchase.where(user: current_user).includes(:user, :shoe)
    @total_purchases = @purchases.pluck('price').inject(0){ |sum, x| sum + x }
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :birthday,:description, :password, :password_confirmation)
  end

end
