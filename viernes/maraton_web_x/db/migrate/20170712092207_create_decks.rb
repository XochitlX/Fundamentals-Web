class CreateDecks < ActiveRecord::Migration[4.2]
  def change
    create_table :decks do |t|
      t.string :subject
    end
  end
end
