class AlterComment < ActiveRecord::Migration[5.0]
  def change
  change_column :comments , :like_count ,:bigint ,default: 0
  change_column :comments , :dislike_count ,:bigint ,default: 0
  end
end
