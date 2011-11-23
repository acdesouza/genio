class CreateWishes < ActiveRecord::Migration
  def up
    create_table :wishes do |t|
      t.string :item
      t.integer :price

      t.timestamps
    end
  end

  def down
    drop_table :wishes
  end
end
