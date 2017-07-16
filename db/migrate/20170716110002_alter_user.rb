class AlterUser < ActiveRecord::Migration[5.0]
  def change
    execute "ALTER TABLE users ADD CONSTRAINT email_unique UNIQUE (email_id)"
  end
end
