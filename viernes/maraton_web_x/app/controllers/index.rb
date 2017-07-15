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
  #erb :secret
  @all_decks = Deck.all
  erb:chose_deck
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

post '/user/:id_user/deck/elected_deck' do
  p "check elejido" * 10
  p @user_id = params[:id_user]
  p deck = params[:check]
  p @id_deck = Deck.find_by(subject: deck)
  redirect "/user/#{@user_id}/deck/#{@id_deck.id}"
end

get '/user/:id_user/deck/:id_deck' do
  p "casi imprimir***" * 10
  p @user_id = params[:id_user]
  p @id_deck = params[:id_deck]

  @user = User.find(@user_id)
  @select_cards = Card.where(deck_id: @id_deck) #cartas completas x deck

  #Revolviendo Respuestas x cada pregunta
  card_answer = []
  @select_cards.each do |card|
    card_answer << Answer.where(card_id: card.id).sort_by{rand}
  end
  p @card_answer = card_answer  #answer completas x deck
  
  erb:play
end

post "/user/:id_user/deck/:id_deck/game" do
  p @user_id = params[:id_user]
  p @id_deck = params[:id_deck]
  p "****************ANSWER*************" * 10
  p relation = params[:deck]

  p @new_round = Round.create(user_id: @user_id, deck_id: @id_deck)
  count = 0
  item = 0
  relation.each do | card, user_answer |
    p card
    p user_answer

    if Answer.find_by(card_id: card, status: true) == Answer.find(user_answer)
      p "resp buena---- score"
      p Statistic.create(round_id: @new_round.id, card_id: card, answer_id: user_answer, score: 1)
      count += 1
    else
      p "mala"
      p Statistic.create(round_id: @new_round.id, card_id: card, answer_id: user_answer, score: 0)
    end
    item += 1
  end
  
  new_statistic = Statistic.where(round_id: @new_round.id)
  @count = count
  @item = item
  @user = User.find(@user_id)
  erb :actual_result
end

post '/data/:id' do
  p "entro a esta"* 50
  id = params[:id]
  games = Round.where(user_id: id)

  data = []
  games.each do |game|
    p "juego no. "
    p game.id
    p "next"
    p data << [Statistic.where(round_id: game.id)]
  end
  @user = User.find(id)
  @data = data
  erb:info
end

post '/log_out' do
  session[:user_id] = nil
  erb :index
end



