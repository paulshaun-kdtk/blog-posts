class ModifyUserAttributes < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :posts_counter, 0
    change_column_null :users, :name, true
    change_column_null :users, :photo, true
    change_column_null :users, :bio, true
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :unconfirmed_email, :string # Only if using reconfirmable
  end
end
