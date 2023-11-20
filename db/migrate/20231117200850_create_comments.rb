class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :text, null: false
      t.integer :author_id
      t.integer :post_id

      t.timestamps
    end

    add_foreign_key :comments, :users, column: :author_id
    add_foreign_key :comments, :posts
  end
end
