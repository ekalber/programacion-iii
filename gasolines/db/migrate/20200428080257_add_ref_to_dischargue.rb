class AddRefToDischargue < ActiveRecord::Migration[6.0]
  def change
    add_reference :dischargues, :load, null: true, foreign_key: true
    add_reference :dischargues, :station, null: true, foreign_key: true
  end
end
