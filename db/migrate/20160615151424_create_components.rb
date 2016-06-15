class CreateComponents < ActiveRecord::Migration
  def change
    create_join_table :posts, :resources, table_name: :components
  end
end
