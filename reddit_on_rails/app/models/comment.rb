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

class Comment < Post
  validates_presence_of :post_id
  
  belongs_to :post,
  foreign_key: :post_id,
  class_name: :Post
end
