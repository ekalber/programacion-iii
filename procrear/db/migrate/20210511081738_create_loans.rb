class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.date :date
      t.float :amount
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
