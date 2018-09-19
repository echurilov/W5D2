class UpdatePostsAgain < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :title, :string
    add_column :posts, :url, :string
    add_column :posts, :post_id, :integer
  end
end
