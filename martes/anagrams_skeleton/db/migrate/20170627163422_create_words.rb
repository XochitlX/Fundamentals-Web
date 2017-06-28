class CreateWords < ActiveRecord::Migration[4.2]
  def change
    create_table :words do |t|
      t.string :name
      t.string :canonical
    end
  end
end
