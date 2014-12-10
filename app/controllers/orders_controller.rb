class OrdersController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to order_path(@order)
    else
      puts @order.errors.to_yaml
      render :new, alert: @order.errors.full_messages
    end

  end

  private

  def order_params
    params.require(:order).permit(:formula, :temperature, :pickup_start_date, :pickup_end_date, :delivery_start_date, :delivery_end_date)
  end

end