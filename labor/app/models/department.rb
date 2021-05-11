class Department < ApplicationRecord
    has_many :people
    
    validates :name, :uniqueness => true, :presence => true
end
