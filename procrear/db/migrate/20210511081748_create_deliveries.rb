class CreateDeliveries < ActiveRecord::Migration[6.1]
  def change
    create_table :deliveries do |t|
      t.date :date
      t.float :amount
      t.references :loan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
