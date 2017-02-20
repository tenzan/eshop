class Admin::ProductsController < Admin::ApplicationController

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

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = 'Product has been updated.'
      redirect_to @product
    else
      flash.now[:alert] = "Product has not been updated."
      render "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    flash[:notice] = 'Product has been deleted.'
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end

end
