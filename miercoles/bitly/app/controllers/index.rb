get '/' do
  # Deja a los usuarios crear una URL reducida y despliega una lista de URLs. 
  @total_url = Url.all.order(id: :desc)
  erb:index
end

post '/urls' do
  # crea una nueva Url
  complete_url = params[:info_url]
  if complete_url != ""
    Url.create(long_url: complete_url)
    redirect '/'
  else
    redirect '/'
  end
end


get '/:short_url' do
  # redirige a la URL original
  #p "**" * 50
  url_id = params[:short_url]
  #p "** id" * 20
  page = Url.find(url_id)
  page.click_count += 1
  page.save
  redirect (page.long_url)

end