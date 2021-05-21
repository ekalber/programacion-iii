class Child < ApplicationRecord
    paginates_per 1

    has_many :vaccine_applications

    def full_name
        first_name + " " + last_name
    end
end
