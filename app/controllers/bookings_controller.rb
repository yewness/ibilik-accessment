# Display new booking
# Create new booking

get '/properties/:id/bookings/new' do
	@property = Property.find(params[:id])
	erb :'booking/new'
end

post '/properties/:id/bookings' do
	@property = Property.find(params[:id])
	booking = @property.bookings.create(booking: params[:booking], user_id: session[:user_id])
	redirect "/users/#{booking.user_id}"
end

# # Delete booking

delete '/properties/:property_id/bookings/:id' do
	booking = Booking.find(params[:id])
	booking.destroy
	redirect to "/users/#{booking.user_id}"
end