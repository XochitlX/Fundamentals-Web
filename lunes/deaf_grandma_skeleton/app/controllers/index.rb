get '/' do
  @abuelita = params[:abuelita]
  
  erb :index
  # Visita app/views/index.erb
end


post '/abuelita' do
  user_input = params[:user_input]

  if user_input.upcase == "BYE TQM" || user_input.downcase == "bye tqm"
    redirect to('/?abuelita=Bye hijo tqm')
  elsif user_input.upcase == user_input
    redirect to('/?abuelita=NO, NO DESDE 1983')
  else
    redirect to('/?abuelita=HUH?! NO TE ESCUCHO, HIJO!')
  end
    
end

