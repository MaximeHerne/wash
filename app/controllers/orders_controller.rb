class OrdersController < ApplicationController
  before_action :set_profile

  def index
    @orders = current_user.orders
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
    @order = Order.new(formula: Formula.find(order_params[:formula_attributes][:id]), temperature: order_params[:temperature])

    pickup_time = convert_to_datetime(order_params_with_time[:pickup_start_date], order_params_with_time[:pickup_start_time])
    delivery_time = convert_to_datetime(order_params_with_time[:delivery_start_date], order_params_with_time[:delivery_start_time])

    @order.pickup_start_date = pickup_time
    @order.delivery_start_date = delivery_time

    @order.user = current_user

    if @order.save
      redirect_to order_path(@order)
    else
      puts @order.errors.to_yaml
      render :new, alert: @order.errors.full_messages
    end
  end

  private
   def order_params
    params.require(:order).permit(:temperature, :formula_attributes => [:id])
  end

  def order_params_with_time
    params.require(:order).permit(:temperature, :pickup_start_date, :pickup_start_time, :delivery_start_date, :delivery_start_time, :formula_attributes => [:id])
  end

  def set_profile
    @profile = Profile.find(current_user.profile)
  end

  def convert_to_datetime(date_string, time_string)
    date = DateTime.strptime(date_string, '%m/%d/%Y')
    time_in_seconds = Time.parse(time_string).seconds_since_midnight.seconds
    (date + time_in_seconds).to_datetime
  end
end