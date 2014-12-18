class OrdersController < ApplicationController
  before_action :set_profile

  def index
    @orders_sent = current_user.orders
    @orders_received = current_user.orders.where(washer: current_user)
  end

  def show
    @order = Order.find(params[:id])
    @profile = current_user.profile
    @profile_coordinates = { lat: @profile.latitude, lng: @profile.longitude }
    if @order.user == current_user
      render :show
    else
      redirect_to root_path
    end
  end

  def new
    @order = Order.new
    @order.build_formula
    @formulas = Formula.all
  end

  def create
    @order = current_user.orders.new(order_params_with_time)

    if @order.save
      redirect_to order_path(@order)
    else
      render :new, alert: @order.errors.full_messages
    end
  end

  private
   def order_params
    params.require(:order).permit(:temperature, :formula_attributes => [:id])
  end

  def order_params_with_time
    params.require(:order).permit(:delivery_bracket, :pickup_bracket, :pickup_start_date, :delivery_start_date, :temperature, :pickup_date, :pickup_start_time, :delivery_date, :delivery_start_time, :formula_attributes => [:id])
  end

  def set_profile
    @profile = Profile.find(current_user.profile)
  end
end