class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :start
      t.date :end
      t.string :money
      t.string :num

      t.timestamps
    end
  end
end
