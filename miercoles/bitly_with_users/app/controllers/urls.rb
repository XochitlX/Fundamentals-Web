
post '/urls' do
  # crea una nueva Url
  complete_url = params[:info_url]
  if complete_url != ""
    Url.create(user_id: 1, long_url: complete_url)
    redirect '/'
  else
    redirect '/'
  end
end

post '/urls_log' do
  complete_url = params[:info_url]
  if complete_url != ""
    @user = User.find(session[:user_id])
    Url.create(user_id: @user.id, long_url: complete_url)
    redirect '/secret'
  else
    redirect '/secret'
  end
end

get '/short_url/:id' do
  p "entro id***" * 20
  p info_id = params[:id]
  info = Url.find(info_id)
  p "Larga***********" * 20
  p info.long_url
  p "CONTADOR¡¡¡¡¡********" * 20
  p info.click_count += 1
  info.save
  redirect "#{info.long_url}"
end