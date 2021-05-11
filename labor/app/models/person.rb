class Person < ApplicationRecord
  belongs_to :department
  has_many :tasks

  validates :first_name, :last_name, :document_number, :gender, :birth_date, :department_id, :presence => true
  validates :document_number, :uniqueness => true

  def full_name
    first_name + " " + last_name
  end

  def sexo
    if gender == 1
      "Masculino"
    else
      "Femenino"
    end
  end

  def edad
    Time.now.year - birth_date.year
  end
end
