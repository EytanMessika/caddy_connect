class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.datetime :datetime
      t.string   :address
      t.timestamps
    end
  end
end
