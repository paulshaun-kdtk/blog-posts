class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.integer :author_id
      t.integer :post_id

      t.timestamps
    end

    add_foreign_key :likes, :users, column: :author_id
    add_foreign_key :likes, :posts
  end
end
