class User < ActiveRecord::Base
  has_many :rounds
  has_many :decks, through: :rounds


  def self.authenticate(email, password)
    if user = User.find_by(email: email, password: password)
      user
    else
      nil
    end
  end

end
