class Api::V1::ProductsController < ApplicationController

  before_action :authenticate_api_v1_user!, only: [:buy]

  def index
    @products = Product.includes(:main_image)

    @products = @products.text_search(params[:search]) if params[:search]
    @products.where!(price: params[:min]..params[:max]) if params[:min] and params[:max]
    @products.order!(params[:order])
    @products = @products.paginate(page: params[:page])
  end

  def info
    @info = { max: Product.maximum(:price), min: Product.minimum(:price)}
  end

  def find
    @product = Product.includes(:images).order('images.path').friendly.find(params[:slug])
  end

  def buy
    @user = current_api_v1_user
  end
end
