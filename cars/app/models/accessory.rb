class Accessory < ApplicationRecord
	has_and_belongs_to_many :cars

	validates :name, length: { maximum: 100 }, presence: true

end
