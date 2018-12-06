class ProductsController < ApplicationController


  # why is there order filter??
  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
  end

end
