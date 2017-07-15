class Statistic < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :round
  belongs_to :answer
  belongs_to :card
end
