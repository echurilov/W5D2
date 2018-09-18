class Post < ApplicationRecord
  validates_presence_of :title, :author_id, :sub_id
  
  belongs_to :author,
  foreign_key: :author_id,
  class_name: :User
  
  belongs_to :sub,
  foreign_key: :sub_id,
  class_name: :Sub
end
