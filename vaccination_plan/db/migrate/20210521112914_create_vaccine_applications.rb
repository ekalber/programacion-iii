class CreateVaccineApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :vaccine_applications do |t|
      t.references :vaccine, null: false, foreign_key: true
      t.references :nurse, null: false, foreign_key: true
      t.references :child, null: false, foreign_key: true
      t.date :date
      t.integer :dosis

      t.timestamps
    end
  end
end
