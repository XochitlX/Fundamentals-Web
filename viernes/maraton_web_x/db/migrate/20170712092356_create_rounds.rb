class CreateRounds < ActiveRecord::Migration[4.2]
  def change
    create_table :rounds do |t|  #id users, id decks
      t.belongs_to :user, index: true
      t.belongs_to :deck, index: true
    end
  end
end
