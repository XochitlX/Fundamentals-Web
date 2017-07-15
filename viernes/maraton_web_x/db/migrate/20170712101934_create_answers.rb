class CreateAnswers < ActiveRecord::Migration[4.2]
  def change
    create_table :answers do |t|
      t.belongs_to :card, index: true
      t.string :option
      t.boolean :status
    end
  end
end
