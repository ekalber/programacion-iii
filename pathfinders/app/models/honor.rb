class Honor < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :members

  validates :name, :presence => true
end
