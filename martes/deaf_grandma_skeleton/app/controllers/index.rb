get '/' do
  @abuelita = params[:abuelita]
  p "***Aqui****"
  p @abuelita
  erb :index
  # Visita app/views/index.erb
end


post '/abuelita' do
  user_input = params[:user_input]
  p "*" * 50
  p user_input
  msn = special(user_input)
  p msn
  if request.xhr?
    msn
  else
    redirect to("/?abuelita=#{msn}")
  end
    
end


def special(user_input)
  if user_input.upcase == "BYE TQM" || user_input.downcase == "bye tqm"
      'Bye hijo tqm'
    elsif user_input.upcase == user_input
      'NO, NO DESDE 1983'
    else
      'HUH?! NO TE ESCUCHO, HIJO!'
    end
end

