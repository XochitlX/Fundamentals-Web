# Este archivo sirve para correr código que te permita 
# rellenar tu base de datos con información. 

File.open('words', 'r') do |info|
  while linea = info.gets
    linea = linea.chomp 
    new_word = linea.chars.sort!.join
    Word.create(name: linea, canonical: new_word)  
  end
end

# File.open("solo_correos.txt") do |archivo|
#          archivo.each do |linea|  

#word.chars.sort!.join


