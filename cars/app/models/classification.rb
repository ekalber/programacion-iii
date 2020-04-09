class Classification < ApplicationRecord
	has_many :cars

	validates :name, presence: :true,  length: { maximum: 100 }
end
