class User < ApplicationRecord
  validates :name, presence:true
  validates :email_id ,presence:true
  has_many :user_comments
  has_many :comments ,through: :user_comments
end
