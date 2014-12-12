class Order < ActiveRecord::Base
  belongs_to :user
  has_one :review
  has_one :formula

  accepts_nested_attributes_for :formula, :review

  attr_accessor :start_time_range, :end_time_range

  def pickup_start_time
  end

  def delivery_start_time
  end
end
