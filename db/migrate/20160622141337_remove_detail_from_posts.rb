class RemoveDetailFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :detail, :text
  end
end
