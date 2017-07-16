class CreateUserComments < ActiveRecord::Migration[5.0]
  def change
    create_table :user_comments do |t|
      t.bigint :comment_id
      t.bigint :user_id
      t.bigint :post_id

      t.timestamps
    end
  end
end
