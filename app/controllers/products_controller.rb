class ProductsController < ApplicationController
  def index
    #code
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = 'Product has been created.'
      redirect_to @product
    else
      flash.now[:alert] = 'Product has not been created.'
      render 'new'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
