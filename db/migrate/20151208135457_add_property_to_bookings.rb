class AddPropertyToBookings < ActiveRecord::Migration
	def change
		add_column :bookings, :property_id, :integer
	end
end
