class DeleteTokenFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :token, :text
  end
end
