class AddDetailsToPost < ActiveRecord::Migration
  def change
    add_column :posts, :details, :text
  end
end
