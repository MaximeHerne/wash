class Profile < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user
  validates_uniqueness_of :user

  geocoded_by :full_address
  after_validation :geocode


  def complete?
    self.first_name.present? && self.last_name.present? && self.phone.present? && self.address.present? && self.locality.present? && self.postal_code.present?
  end

  def full_address
    "#{self.user.profile.address}, #{self.user.profile.postal_code}, #{self.user.profile.locality}"
  end

end
