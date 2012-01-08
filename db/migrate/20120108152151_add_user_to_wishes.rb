class AddUserToWishes < ActiveRecord::Migration
  def change
    change_table :wishes do |t|
      t.references :user
    end
  end
end
