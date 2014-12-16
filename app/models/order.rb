class Order < ActiveRecord::Base
  belongs_to :user
  has_one :review
  has_one :formula


  accepts_nested_attributes_for :formula, :review

  after_create :send_new_order_email

  attr_accessor :start_time_range, :end_time_range

  def pickup_start_time
  end

  def delivery_start_time
  end

  private

  def send_new_order_email
    OrderMailer.new_order(self).deliver
  end


end
