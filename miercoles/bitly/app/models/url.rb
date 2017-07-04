class Url < ActiveRecord::Base
  # Remember to create a migration!
  before_create :cut_url

  def cut_url
    self.short_url = ([*('a'..'z'),*('0'..'9')]-%w(0 1 I O)).sample(8).join
  end
end
