class Load < ApplicationRecord
	belongs_to :truck
	has_many :dischargues

	validates :liters, :date, :liter_amount, :presence => true
	validates :liters, :liter_amount, :numericality => true
	validate :full_truck
	validate :full_liters

	def full_truck
		if truck.remaining_liters < liters
			self.errors[:truck_id] << "El camión seleccionado no tiene lugar para esa cantidad de litros"
		end		
	end

	def full_liters
		if truck.max_liters < liters
			self.errors[:truck_id] << "Los litros superan la capacidad del camión"
		end
	end

	def dischargues_liters
		l = 0
		dischargues.each do | dis |
			l = l + dis.liters
		end
		l
	end
end
