class VaccineApplication < ApplicationRecord
  belongs_to :vaccine
  belongs_to :nurse
  belongs_to :child
end
