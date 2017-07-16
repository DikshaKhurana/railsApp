class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :comment
      t.bigint :like_count
      t.bigint :dislike_count

      t.timestamps
    end
  end
end
