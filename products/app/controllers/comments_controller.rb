class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end
  def add
    @update_product = Product.find(params[:id]).comments.create(comment_params)
    if @update_product.errors.any?
      puts @update_product.errors
      redirect_to product_path(params[:id]), alert: @update_product.errors.full_messages
    else
      redirect_to product_path(params[:id])
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:comment)
    end

end
