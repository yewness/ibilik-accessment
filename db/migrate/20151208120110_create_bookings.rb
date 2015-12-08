class CreateBookings < ActiveRecord::Migration
	def change
		create_table :bookings do |t|
			t.integer :property_id
			t.integer :user_id
			t.integer :booking
			t.timestamps null:false
		end
	end
end
