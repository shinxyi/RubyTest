class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  def set_product
    @product = Product.find(params[:id])
  end
  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.create(product_params)
    if @product.errors.any?
      puts @product.errors
      redirect_to products_new_path, alert: @product.errors.full_messages
    else
      redirect_to root_path
    end
  end

  def update
    @product.update_attributes(product_params)
    if @product.errors.any?
      redirect_to "/products/#{@product.id}/edit", alert: @product.errors.full_messages
    else
      redirect_to root_path
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :pricing, :category_id)
    end

end
