class Sub < ApplicationRecord
  validates_presence_of :title, :description, :user_id
  
  belongs_to :moderator,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User
end
