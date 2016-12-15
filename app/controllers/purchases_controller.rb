class PurchasesController < ApplicationController
  before_action :require_login

  def create
    shoe = Shoe.find(params[:shoe_id])
    Purchase.create(user: current_user, shoe: shoe)
    redirect_to "/dashboard/#{current_user.id}"
  end
end
