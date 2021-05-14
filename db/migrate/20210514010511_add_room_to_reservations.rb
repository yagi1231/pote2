class AddRoomToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :room, :string
  end
end
