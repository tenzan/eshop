class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  private
  def set_product
    @product = Product.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The product you were looking for could not be found."
    redirect_to products_path
  end
  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
