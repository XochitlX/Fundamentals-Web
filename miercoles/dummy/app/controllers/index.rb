before '/secret' do
  redirect ('/log') unless session[:user_id]
end



get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  erb :index
  
end

get '/start' do
  #p "option start****"
  erb :log
end

get '/new' do
  #p "option new user****"
  erb :new_user
end

get '/secret' do
  @user = User.find(session[:user_id])
  erb :secret
end

get '/log' do
  @wrong_msn = "Para acceder... Ingresar los datos correctos"
  erb :log
end

post '/new' do
  #p "*" * 20
  new_name = params[:new_name]
  new_email = params[:new_email]
  new_password = params[:new_password]
 
  if new_name != "" || new_email != "" || new_password != ""
    User.create(name: new_name, email: new_email, password: new_password)
    redirect '/start'
  else
    redirect '/new'
  end

end

post '/enter_user' do
  #p "**Log innnnn***********"
  user_email = params[:user_email]
  user_password = params[:user_password]
  
  user = User.authenticate(user_email, user_password)
  if user
     p "sesion+" * 10
     session[:user_id] = user.id #creando sesion 
     redirect '/secret'
   else
    #session[:user_id] = nil #/clear
    redirect '/secret'
  end
end

post '/log_out' do
  session[:user_id] = nil
  erb :index
end



