class Card < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :deck 
  has_many :answers
  has_many :statistics
end
