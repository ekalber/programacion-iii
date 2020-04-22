class Car < ApplicationRecord
	belongs_to :brand
	has_and_belongs_to_many :accessories

	belongs_to :classification
	belongs_to :structure

	validates :doors, :year, numericality: true
	validates :color, :model, :brand_id, presence: :true

	validate :doors_and_color
	validate :relacion_estructura

	def doors_and_color		
		if self.doors > 5 and self.color == "Blanco"
			errors.add(:doors, "No puede tener mas de 5 puertas y ser de color blanco")
		end
	end

	def relacion_estructura
		if self.structure.name == "Convertible" and self.doors > 2
			errors.add(:structure, "No puede ser convertible y tener mas de 2 puertas")
		end
	end

end
