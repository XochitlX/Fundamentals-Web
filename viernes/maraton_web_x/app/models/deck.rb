class Deck < ActiveRecord::Base
  # Remember to create a migration!
  has_many :rounds
  has_many :users, through: :games
  has_many :cards

  

end
