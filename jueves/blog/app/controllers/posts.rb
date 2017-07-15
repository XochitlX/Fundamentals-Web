
post "/new_post" do
  p "*******new_post" * 20 
  p new_title = params[:new_title]
  p new_info = params[:new_info]
  p new_tags = params[:info_tags]
  p "post" #se hace.., y de ahi se va a revisar tags
  p created_post = Post.create(title: new_title, text: new_info)
  p created_id = created_post.id
  p "actualizando"
  p complete_new = created_id.to_s + " " + new_tags
  p "tags"
  redirect "/check_tags/#{complete_new}"
  #p Tag.create(name: "Groupo") 
  #redirect '/'
end

get '/check_tags/:value' do
  p "splittttt***********" * 10
  p complete_new = params[:value]
  p complete_new = complete_new.split(" ")
  p info_id_post = complete_new.first.to_i
  p new_tags = complete_new.drop(1)
  
  total_tags = Tag.all
  all_tags = []

  total_tags.each do |tag|
    all_tags << tag.name
  end
  
  p all_tags
  

  new_tags.each do |new_tag|
    if all_tags.include?(new_tag)
      p "nadaaaaaaaa tag" * 20
      p new_tag
      p exist_tag = Tag.find_by(name: new_tag)
      p info_id_tag = exist_tag.id
      p Connection.create(post_id: info_id_post, tag_id: info_id_tag)


    else
      p "new tag" * 10
      p new_tag
      
      created_tag = Tag.create(name: new_tag)
  info_id_tag = created_tag.id
  
      p info_id_post
      p info_id_tag
      p Connection.create(post_id: info_id_post, tag_id: info_id_tag)
    end
  end
  redirect '/'
end



post '/change_post/:id_post' do
  p "*********************en el CHANGE"
  p id = params[:id_post]
  p new_title = params[:change_title]
  p new_info = params[:change_info]
  all_post = Post.all
  p "siguiente..."
  
  p actual_post = Post.find(id)
  (actual_post.title != new_title) ? Post.update(id, title: new_title) : Post.update(id, title: actual_post.title)
  (actual_post.text != new_info) ? Post.update(id, text: new_info) : Post.update(id, text: actual_post.title)

  p @update_post = Post.find(id)
  #p @update_post = Post.update(id, title: new_title, text: new_info)
  erb:change_post_tags
end

post '/modify_post/:id' do
  p "Modificandooooo" * 10
  p info = params[:id]
  p @info_post = Post.find(info)
  erb:post_change
end

post '/complete_modify/:id' do
  id = params[:id]
  new_title = params[:change_title]
  new_info = params[:change_info]

  p Post.update(id, title: new_title, text: new_info)
  redirect '/ '
end


get '/post/:id_post/tag/:id_tag' do
  p @id_post = params[:id_post]
  p @id_tag = params[:id_tag]

  #p post_original=Connection.where(post_id: @id_post, tag_id: @id_tag)
  p @changee = Tag.find_by(id: @id_tag)
  erb:tag_change
end

post '/post/:id_post/tag/:id_tag' do
  p id_post = params[:id_post]
  p id_tag = params[:id_tag]
  p change = params[:change]
  
  p "cambioooooooooo" * 50
  p post_original=Connection.where(post_id: id_post, tag_id: id_tag) 
  #p post_original[0].id
  p new_tag = Tag.create(name: change)

  p "conexionessss"

post_original.update(tag_id: new_tag.id)

  redirect "/post/#{id_post}"

end



get '/post/:id' do
  p "****CAMBIAR POSTTT" * 20
  p post1 = params[:id]
  all_post = Post.all
  p @post_to_change = all_post.find_by(id: post1)
  erb:change_post
end


post '/quit_post/:id' do
  p quit_id = params[:id]
  all_connection = Connection.all
  p "QUITANDO***___"
  p check = all_connection.where(post_id: quit_id)


  check.each do |connection|
    p "DESTRUYENDO***" * 10
    p Connection.destroy(connection.id)
     
  end
  
  p Post.destroy(quit_id)

  redirect '/'
end




get '/tag/:new_values' do
  p "****CAMBIAR TAG" * 20
  p @tag1 = params[:new_values]
  p @tag_to_change = Tag.find_by(name: @tag1)

  #p tag_to_change = tag_to_change.id


  p "interessssssss"
  
  p @relation_post = @tag_to_change.posts

  erb :change_tag
end

post '/quit_tag/:tag_id' do
  p "ELIMINANDOOOOOOOOO"
  tag_id = params[:tag_id].to_i
  posts_to_find = Tag.find(tag_id).destroy
  # posts_to_find.each do |post|
  #   Connection.find_by(post_id: post.id, tag_id: tag_id).destroy
  # end
  redirect '/'
  #post_to_delete.delete
  end


