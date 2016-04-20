class AddDetailToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :detail, :text
  end
end
