class Profile < ActiveRecord::Base
  belongs_to :user

  # def complete?
  #   self.first_name.present? &&
  # end
end
