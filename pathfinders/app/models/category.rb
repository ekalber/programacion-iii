class Category < ApplicationRecord
	has_many :honors

	validates :name, :presence => true
end
