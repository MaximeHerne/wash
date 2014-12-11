class Profile < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user
  validates_uniqueness_of :user

  def complete?
    self.first_name.present? && self.last_name.present? && self.phone.present? && self.address.present? && self.locality.present? && self.postal_code.present?
  end
end
