class StoreProductsController < ApplicationController

  def index
    @store_products = StoreProduct.includes(:store).includes(:product)
  end

  def new
    @store_product = StoreProduct.new
    @products = Product.all
    @stores = Store.all
  end

  def create
    @store_product = StoreProduct.new(store_product_params)

    respond_to do |format|
      if @store_product.save
        format.html { redirect_to store_products_path, notice: 'Store was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def store_product_params
    params.require(:store_product).permit(:quantity, :product_id, :store_id, :quantity, :available)
  end

end
