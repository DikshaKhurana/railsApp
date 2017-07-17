class Comment < ApplicationRecord
  has_one :user_comment
  has_one :user, through: :user_comment
end
