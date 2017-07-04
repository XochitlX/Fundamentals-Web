
get '/' do
  # Deja a los usuarios crear una URL reducida y despliega una lista de URLs. 
  @complete_url = params[:complete_url]
  p "****get***"
  #p info_url
  p @complete_url
  erb :index
end

post '/urls' do
  # crea una nueva Url
  @info_url = params[:info_url]
  p "***info_url**"
  p @info_url

  redirect to("/?complete_url=#{@info_url}")
end

# e.g., /q6bda
get '/:short_url' do
  # redirige a la URL original
  #before_create :set_url
end




# def set_url
#   #self.login = self.first_name

# end
