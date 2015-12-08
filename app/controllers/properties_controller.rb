# Display new properties form

get '/properties/new' do
	erb :"property/new"
end

# Create new properties

post '/properties' do
	property = Property.create(title: params[:title], user_id: session[:user_id], body: params[:body])
	redirect "/properties/#{property.id}"
end

# Display property edit form

get '/properties/:id/edit' do
	@property = Property.find(params[:id])
	erb :'property/edit'
end 

# Update property

patch '/properties/:id' do
	property = Property.find(params[:id])
	property.update(title: params[:title], body: params[:body])
	redirect "/properties/#{property.id}"
end

# Delete property

delete '/properties/:id' do
	property = Property.find(params[:id])
	property.destroy
	erb :'property/index'
end

# View all property by the id

get '/properties/:id' do
	@property = Property.find(params[:id])
	erb :'property/show'
end

#official index posts

get '/properties' do
	erb :'property/index'
end