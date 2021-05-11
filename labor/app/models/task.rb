class Task < ApplicationRecord
  belongs_to :person

  validates :assignment_date, :finish_date, :description, :state, :person_id, :presence => true

  def estado
    if state == 1
      "Sin iniciar"
    elsif state == 2
      "En progreso"
    else
      "Finalizada"
    end
  end
end
