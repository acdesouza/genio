class AddProductToBids < ActiveRecord::Migration
  def up
    change_table :bids do |t|
      t.references :product
    end
  end

  def down
    remove_column :bids, :product_id
  end
end
