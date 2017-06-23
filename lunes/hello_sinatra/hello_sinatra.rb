require "sinatra"

get "/" do
  #"Hello, world!"
  #name = "xochitl"
  count_vowels("xochitl tufiño")
end
def count_vowels(name)
  t = name.count("aeiou")
  "My name is #{name} and it has #{t} vowels"
end
