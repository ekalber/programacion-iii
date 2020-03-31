class AddBrandIdToCars < ActiveRecord::Migration[6.0]
  def change
    add_reference :cars, :brand, null: true, foreign_key: true
  end
end
