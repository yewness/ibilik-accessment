#User login

post '/users/login' do
  user = User.find_by(email: params[:email])
	if user && user.authenticate(params['password'])
		session[:user_id] = user.id
		redirect "/users/#{user.id}"
	else
		@notice = "Invalid email/password"
		erb :"user/index"
	end
end

# User logout

get '/users/logout' do
	session[:user_id] = nil
	redirect '/'
end

# Display new user form

get '/users/new' do
	erb :"user/new"
end

# Create new user

post '/users' do
	user = User.create(name: params[:name], email: params[:email], password: params[:password])
		if user.valid?
			@notice = "Your account was created. Please login."
			redirect "/users?created=#{@notice}"
		else
			@notice = user.errors.full_messages
			redirect "/users/new?error_msg=#{@notice}"
		end
end

# Display user edit form

get '/users/:id/edit' do
	@user = User.find(params[:id])
	erb :'user/edit'
end 

# Update user

patch '/users/:id' do
	user = User.find(params[:id])
		if params[:password].nil?
			user.password = params[:password]
		end
	user.update(name: params[:name], email: params[:email])
	redirect "/users/#{user.id}"
end

# Delete user

delete '/users/:id' do
	user = User.find(params[:id])
	user.destroy
	erb :'post/index'
end

# View user profile

get '/users/:id' do
	@user = User.find(params[:id])
	erb :'user/show'
end

# View login page

get '/users' do
	@user = current_user
		if logged_in?
			session[:user_id] = @user.id
			redirect "/users/#{@user.id}"
			erb :'user/show'
		else
			erb :'user/index'
		end
end