class Category < ApplicationRecord
    has_many :books

    validates :name, :presence => true, :uniqueness => true
    validates :abbreviation, length: { minimum: 3 }, allow_blank: true
    
    #validates :abbreviation, length: { maximum: 500 }
    #validates :abbreviation, length: { in: 6..20 }
    #validates :abbreviation, length: { is: 6 }
end
