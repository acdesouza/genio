class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.decimal :price
      t.date :due_to
      t.integer :qtd
      t.string :url

      t.timestamps
    end
  end
end
