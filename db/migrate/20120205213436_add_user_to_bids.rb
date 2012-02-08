class AddUserToBids < ActiveRecord::Migration
  def up
    change_table :bids do |t|
      t.references :user
    end
  end

  def down
    remove_column :bids, :user_id
  end
end
