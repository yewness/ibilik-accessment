class RemovePostToBookings < ActiveRecord::Migration
	def change
      	remove_column :bookings, :post_id
	end
end