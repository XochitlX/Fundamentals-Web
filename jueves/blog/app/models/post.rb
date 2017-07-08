class Post < ActiveRecord::Base
  # Remember to create a migration!
  validates :title, presence: true
  validates :text, presence: true

  has_many :connections
  has_many :tags, through: :connections
end
