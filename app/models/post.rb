class Post < ApplicationRecord
  #self.per_page = 10
  validates :title, presence:true
  validates :summary, presence:true
end
