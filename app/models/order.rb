class Order < ActiveRecord::Base
  belongs_to :user
  has_one :review
  has_one :formula
end
