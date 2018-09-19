# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  content    :string
#  sub_id     :integer          not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string
#  url        :string
#  post_id    :integer
#

class Post < ApplicationRecord
  belongs_to :author,
  foreign_key: :author_id,
  class_name: :User
  
  has_many :comments,
  foreign_key: :post_id,
  class_name: :Comment
end
