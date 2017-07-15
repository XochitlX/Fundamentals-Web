class Tag < ActiveRecord::Base
  # Remember to create a migration!
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :connections, dependent: :destroy
  has_many :posts, through: :connections
end
