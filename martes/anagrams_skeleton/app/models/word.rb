class Word < ActiveRecord::Base
  # Remember to create a migration!
  
  #palabra = "warm"
  def self.find_all(palabra)
    if Word.where(name: palabra).exists? == true
      w = Word.find_by name: palabra
      anagram = w.canonical
      all_words = Word.all

      final = []
      all_words.each do |item|
        if item.canonical == anagram
          final << item.name
        end
      end
    end
    final
  end

end
