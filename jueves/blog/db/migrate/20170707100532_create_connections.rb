class CreateConnections < ActiveRecord::Migration[4.2]
  def change
    create_table :connections do |t|
      t.belongs_to :post, index: true
      t.belongs_to :tag, index: true
    end
  end
end
