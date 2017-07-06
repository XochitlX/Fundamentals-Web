before '/secret' do
  redirect ('/log') unless session[:user_id]
end


get '/' do
  # Deja a los usuarios crear una URL reducida y despliega una lista de URLs. 
  @total_url = Url.all.order(id: :asc)
  erb:index
end

get '/start' do
  #p "option start****"
  erb :log
end

get '/new' do
  erb :new_user
end


get '/log' do
  @wrong_msn = "Para acceder... Ingresar los datos correctos"
  erb :log
end



post '/new' do
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
  p "*******************************en enter_user"
  p user = User.authenticate(user_email, user_password)
  if user
     p "sesion+" * 10
     p session[:user_id] = user.id #creando sesion 
     redirect '/secret'
   else
    #session[:user_id] = nil #/clear
    redirect '/secret'
  end
end




