class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :washer, foreign_key: :washer_id, class_name: 'User'
  has_one :review
  has_one :formula

  validates_presence_of :temperature, :pickup_start_date, :pickup_start_time, :delivery_start_time, :delivery_start_date

  accepts_nested_attributes_for :formula, :review

  after_create :send_new_order_email

  attr_accessor :start_time_range, :end_time_range
  attr_accessor :pickup_date, :pickup_start_time, :delivery_start_time, :delivery_date

  def formula_attributes=(hash)
    self.formula = Formula.find(hash[:id])
  end

  def pickup_date=(date)
    @pickup_date = date
    if @pickup_date.present? && @pickup_start_time.present?
      write_attribute :pickup_start_date, convert_to_datetime(@pickup_date, @pickup_start_time)
    end
  end

  def pickup_start_time=(time)
    @pickup_start_time = time
    if @pickup_date.present? && @pickup_start_time.present?
      write_attribute :pickup_start_date, convert_to_datetime(@pickup_date, @pickup_start_time)
    end
  end

  def delivery_date=(date)
    @delivery_date = date
    if @delivery_date.present? && @delivery_start_time.present?
      write_attribute :delivery_start_date, convert_to_datetime(@delivery_date, @delivery_start_time)
    end
  end

  def delivery_start_time=(time)
    @delivery_start_time = time
    if @delivery_date.present? && @delivery_start_time.present?
      write_attribute :delivery_start_date, convert_to_datetime(@delivery_date, @delivery_start_time)
    end
  end

  def convert_to_datetime(date_string, time_string)
    date = DateTime.strptime(date_string, '%m/%d/%Y')
    time_in_seconds = Time.parse(time_string).seconds_since_midnight.seconds
    (date + time_in_seconds).to_datetime
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
