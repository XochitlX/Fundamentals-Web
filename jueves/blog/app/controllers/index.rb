get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  p "INICIANDO*****" * 10
  @posts = Post.all
  p "tabla connection" * 20
  p @connection = Connection.all
  p @tags = Tag.all
  erb :index
end
