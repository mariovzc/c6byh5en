class Api::V1::ProductsController < ApplicationController
  before_filter :set_product, only: [:update, :destroy]
  def index
    @products = Product.all
  end
  def create
    @product = Product.new(produt_params)
    if  @product.save
     render json: @product, status: 201
    else
      render json: @product.errors, status: 422
    end
  end
  def update
    if  @product.update(produt_params)
      render json: @product, status: 200      
    else
      render json: @product.errors, status: 422
    end
  end
  def destroy
    @product.destroy
    head :no_content, status: 422    
  end
  private
  def set_product
    @product = Product.find(params[:id])
  end
  def produt_params
    params.permit(:name, :price)    
  end
end