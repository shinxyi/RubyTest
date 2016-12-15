class ShoesController < ApplicationController
  before_action :require_login

  def index
    sold = Purchase.all.pluck('shoe_id')
    @shoes = Shoe.where.not(id: sold)
  end

  def create
    product = Shoe.create(shoe_params.merge({user: current_user}))
    if product.errors.any?
      flash[:alert] = product.errors.full_messages
    end
    redirect_to "/dashboard/#{current_user.id}"
  end

  def destroy
    Shoe.destroy(params[:shoe_id])
    redirect_to "/dashboard/#{current_user.id}"
  end

  private
    def shoe_params
      params.require(:shoe).permit(:name, :price)
    end

end
