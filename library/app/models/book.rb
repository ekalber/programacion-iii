class Book < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :authors

  validates :title, :presence => true, :uniqueness => true
  validates :description, :presence => true

  def is_new
    created_at.today? ? "new!" : ""
  end
end
