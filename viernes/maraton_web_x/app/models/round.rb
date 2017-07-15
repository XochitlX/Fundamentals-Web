class Round < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user #singular
  belongs_to :deck
  has_many :statistics
  has_many :cards, through: :statistics
  has_many :answers, through: :statistics

end
