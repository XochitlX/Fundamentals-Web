get '/' do
  @rolls = []

  3.times { @rolls << Roll.create }
p "*****ROLLS***" * 10
p @rolls
  @win = "WINNER!!" if @rolls.map! { |roll| roll.value }.uniq.count == 1

  erb :index
end



# QUE HACER?: Convierte esta ruta para que utilice Ajax y si la petición no es
# de Ajax de igual forma sirva.
post '/rolls' do
  puts "dentro de post rolls"

  @rolls = []
  p params

  if params[:value]
    3.times { @rolls << Roll.create({ value: value }) }
  else
    3.times { @rolls << Roll.create }
  end

  @win = "WINNER!!" if @rolls.map! { |roll| roll.value }.uniq.count == 1

  erb :index  # TIP: Qué esté haciendo esto y qué debe hacer diferente.

  # if request.xhr?
  #   p "dentro de request"
  #   p params
  #   erb :_die_roll, layout: false
  # end 

end

post '/new' do
  if request.xhr?
    p "dentro de request"
    p params
    p @rolls = [params[:rolls][1].to_i, params[:rolls][4].to_i, params[:rolls][7].to_i]
    p @rolls.class
  end 
 
  erb :_die_roll, layout: false
end








