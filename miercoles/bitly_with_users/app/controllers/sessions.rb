
get '/secret' do
  p "SECRET***" *20
  p @user = User.find(session[:user_id])
  erb :secret
end


post '/log_out' do
  session[:user_id] = nil
  redirect '/'
end
