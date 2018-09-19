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

class Top < Post
  validates_presence_of :title, :author_id, :sub_id
  
  belongs_to :sub,
  foreign_key: :sub_id,
  class_name: :Sub
end
