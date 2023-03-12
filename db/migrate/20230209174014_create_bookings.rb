class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.integer :service_id
      t.integer :user_id
      t.integer :status
      t.datetime :event_date
      t.string :city
      t.string :address
      t.string :phone
      t.text :description
      t.timestamps
    end
  end
end
