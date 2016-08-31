class AddForeignKeysToBookings < ActiveRecord::Migration[5.0]
  def change
    add_reference :bookings, :user, foreign_key: true
    add_reference :bookings, :product, foreign_key: true
  end
end
