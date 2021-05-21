class Nurse < ApplicationRecord
  paginates_per 1
  
  belongs_to :user
  has_many :vaccine_applications

  def full_name
    first_name + " " + last_name
  end
end
