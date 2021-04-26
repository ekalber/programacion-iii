class CreateConsults < ActiveRecord::Migration[6.1]
  def change
    create_table :consults do |t|
      t.datetime :date
      t.references :doctor, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
