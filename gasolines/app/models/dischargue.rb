class Dischargue < ApplicationRecord
	belongs_to :load
	belongs_to :station

	validates :liters, :date, :presence => true
	validates :liters, :numericality => true
	validate :loaded_truck
	validate :station_liters

	def loaded_truck
		if load.truck.liters_load < liters
			self.errors[:truck_id] << "El camión seleccionado no tiene la cantidad de litros que queres descargar"
		end		
	end

	def station_liters
		if station.remaining_liters < liters
			self.errors[:station_id] << "La estación de servicio no tiene esa capacidad"
		end
	end

	def total_amount
		liters * load.liter_amount
	end
end
