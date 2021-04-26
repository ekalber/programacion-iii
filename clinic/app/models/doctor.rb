class Doctor < ApplicationRecord
  belongs_to :speciality
  has_many :consults

  paginates_per 10

  def full_name
    first_name + " " + last_name
  end
end
