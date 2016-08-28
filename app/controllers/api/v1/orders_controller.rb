class Api::V1::OrdersController < ApplicationController
  before_action :authenticate_api_v1_user!


  def create
    @order = Application.new(user: current_api_v1_user, quantity: params[:quantity])
    @order.product = Job.friendly.find(params['product'])
    @order.save
  end

  def index
    @orders = current_api_v1_user.orders.includes(:product)
  end
end
