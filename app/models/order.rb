class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :washer, foreign_key: :washer_id, class_name: 'User'
  has_one :review
  has_one :formula




  accepts_nested_attributes_for :formula, :review

  after_create :send_new_order_email

  attr_accessor :start_time_range, :end_time_range

  def pickup_start_time
  end

  def delivery_start_time
  end

  def done?
    return self.finished_at.present?
  end

  def assigned?
    return self.washer.present?
  end

  def to_be_assigned?
    return !self.done? && !self.assigned?
  end

  def status
    if self.finished_at
      return "Done"
    elsif self.washer
      return "Assigned"
    else
      return "To be Assigned"
    end
  end

  private

  def send_new_order_email
    OrderMailer.new_order(self).deliver
  end


end
