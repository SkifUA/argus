class Admin::ProductsController < Admin::BaseController

  def index
    @products = Product.paginate(:page => params[:page], :per_page => 10)
  end

  def new

  end

  def edit

  end

  def show

  end

  def update

  end

  def destroy

  end
end
