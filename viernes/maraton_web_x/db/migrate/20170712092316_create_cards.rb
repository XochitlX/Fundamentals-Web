class CreateCards < ActiveRecord::Migration[4.2]
  def change
    create_table :cards do |t|
      t.belongs_to :deck, index: true
      t.string :text    
    end
  end
end
