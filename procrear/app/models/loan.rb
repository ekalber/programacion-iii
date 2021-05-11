class Loan < ApplicationRecord
  belongs_to :person

  def person_full_name
    person.full_name
  end
end
