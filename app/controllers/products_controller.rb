class ProductsController < ApplicationController

  def index
    @products = Product.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @product = Product.find params[:id]
    @comments = Comment.find_by_product_id(params[:id]).order('created_at DESK')
  end
end
