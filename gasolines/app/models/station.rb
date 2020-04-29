class Station < ApplicationRecord
	has_many :dischargues

	validates :address, :flag, :max_liters, :presence => true
	validates :max_liters, :numericality => true

	def loaded_liters
		liters = 0
		dischargues.each do | d |
			liters += d.liters
		end
		liters
	end

	def remaining_liters
		max_liters - loaded_liters
	end

	def total_dischargues_amount
		total = 0
		dischargues.each do | d |
			total += d.total_amount
		end
		total
	end
end
