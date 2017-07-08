
post "/new_post" do
  p "*******new_post" * 20 
  p new_title = params[:new_title]
  p new_info = params[:new_info]
  p new_tags = params[:info_tags]
  redirect '/'
end

post '/post/:new_values' do
  p "****CAMBIAR POSTTT" * 20
end

get '/tag/:new_values' do
  p "****CAMBIAR TAG" * 20
  tag1 = params[:new_values]
  tag = Tag.find_by(name: tag1)
  p @post = tag.posts
end

