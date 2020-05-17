class CreateClubs < ActiveRecord::Migration[6.0]
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :slogan
      t.datetime :foundation
      t.text :address
      t.references :member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
