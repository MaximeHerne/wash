class OrdersController < ApplicationController
before_action :set_profile

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
    @profile = Profile.find(current_user.profile)
    if @order.user == current_user
      render :show
    else
      redirect_to root_path
    end
  end

  def new
    @order = Order.new
    @formulas = [["Sans lessive", "Sans lessive"], ["Avec lessive", "Avec lessive"]]
    @time_brackets = [["19:00 - 19:30","190000"], ["19:30 - 20:00","193000"], ["20:00 - 20:30","200000"], ["20:30 - 21:00","203000"], ["21:30 - 22:00","213000"], ["22:00 - 22:30","220000"], ["22:30 - 23:00","223000"], ["23:00 - 23:30","230000"]]
    @temperatures = [["FROID","FROID"], ["30°","30°"], ["40°","40°"], ["50°","50°"], ["60°","60°"]]
  end

  def create
    @order = Order.new(order_params)

    order_params_with_time[:pickup_start_date].gsub!("-","")
    @order.pickup_start_date = DateTime.parse("#{order_params_with_time[:pickup_start_date]}#{order_params_with_time[:pickup_start_time]}")

    order_params_with_time[:delivery_start_date].gsub!("-","")
    @order.delivery_start_date = DateTime.parse("#{order_params_with_time[:delivery_start_date]}#{order_params_with_time[:delivery_start_time]}")
    @order.save

    if @order.save
      redirect_to order_path(@order)
    else
      puts @order.errors.to_yaml
      render :new, alert: @order.errors.full_messages
    end
  end

  private
   def order_params
    params.require(:order).permit(:formula, :temperature)
  end

  def order_params_with_time
    params.require(:order).permit(:formula, :temperature, :pickup_start_date, :pickup_start_time, :delivery_start_date, :delivery_start_time)
  end

  def set_profile
    @profile = Profile.find(current_user.profile)
  end
end