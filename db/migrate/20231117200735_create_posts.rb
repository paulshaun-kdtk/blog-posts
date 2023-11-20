class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false, limit: 250
      t.text :text, null: false
      t.integer :author_id
      t.integer :comments_counter, default: 0
      t.integer :likes_counter, default: 0

      t.timestamps
    end

    add_foreign_key :posts, :users, column: :author_id
  end
end
