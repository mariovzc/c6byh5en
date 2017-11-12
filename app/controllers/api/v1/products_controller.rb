class Api::V1::ProductsController < ApplicationController

  def index
    @products = Product.all
  end
  def create
    @product = Product.new(name: params[:name], price: params[:price])
    if  @product.save
     render json: @product, status: 202
    else
      render json: @product.errors, status: 422
    end
  end
end