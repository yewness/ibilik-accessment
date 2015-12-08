# Display new comment
# Create new comment

get '/properties/:id/comments/new' do
	@property = Property.find(params[:id])
	erb :'comment/new'
end

post '/properties/:id/comments' do
	@property = Property.find(params[:id])
	comment = @property.comments.create(body: params[:body], user_id: session[:user_id])
	redirect "/properties/#{comment.property_id}"
end

# Display comment edit form

get '/properties/:property_id/comments/:id/edit' do
	@property = Property.find(params[:property_id])
	@comment = Comment.find(params[:id])
	erb :"comment/edit"
end 

# Update propertie

patch '/properties/:property_id/comments/:id' do
	comment = Comment.find(params[:id])
	comment.update(body: params[:body])
	redirect "/properties/#{comment.property_id}"
end

# # Delete comment

delete '/properties/:property_id/comments/:id' do
	comment = Comment.find(params[:id])
	comment.destroy
	redirect to "/properties/#{comment.property_id}"
end