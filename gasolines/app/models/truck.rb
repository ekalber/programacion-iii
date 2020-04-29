class Truck < ApplicationRecord
	has_many :loads

	validates :description, :patent, :max_liters, :presence => true
	validates :max_liters, :numericality => true

	def liters_load
		l = 0
		loads.each do | load |
			l += load.liters - load.dischargues_liters
		end
		l
	end

	def remaining_liters
		max_liters - liters_load
	end

	def available_load
		l = nil
		loads.each do | load |
			if (load.liters - load.dischargues_liters) > 0
			  l = load
			  break
			end
		end
		l
	end
end
