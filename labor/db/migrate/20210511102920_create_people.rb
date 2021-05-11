class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.integer :document_number
      t.integer :gender
      t.date :birth_date
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
