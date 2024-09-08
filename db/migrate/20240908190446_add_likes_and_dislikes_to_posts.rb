class AddLikesAndDislikesToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :likes_count, :integer
    add_column :posts, :dislikes_count, :integer
  end
end
