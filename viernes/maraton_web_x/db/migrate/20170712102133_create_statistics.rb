class CreateStatistics < ActiveRecord::Migration[4.2]
  def change
    create_table :statistics do |t|
      t.belongs_to :round, index: true
      t.belongs_to :card, index: true
      t.belongs_to :answer, index: true
      t.boolean :score #, default: 0 #false
    end
  end
end
