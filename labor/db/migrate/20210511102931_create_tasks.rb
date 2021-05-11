class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.date :assignment_date
      t.date :finish_date
      t.string :description
      t.integer :state
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
