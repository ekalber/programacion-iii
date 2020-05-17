class CreateHonorsMember < ActiveRecord::Migration[6.0]
  def change
    create_table :honors_members do |t|
      t.references :member, null: false, foreign_key: true
      t.references :honor, null: false, foreign_key: true
    end
  end
end
