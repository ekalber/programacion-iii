class Member < ApplicationRecord
  belongs_to :unit
  has_and_belongs_to_many :honors

  validates :first_name, :last_name, :document_number, :birth_date, :presence => true
  validates :document_number, :uniqueness => true
end
