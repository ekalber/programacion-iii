class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.integer :document_number
      t.datetime :birth_date
      t.string :phone_number
      t.string :email
      t.references :unit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
