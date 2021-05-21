class Vaccine < ApplicationRecord
    paginates_per 1

    has_many :vaccine_applications
    has_many :nurses, :through => :vaccine_applications
end
