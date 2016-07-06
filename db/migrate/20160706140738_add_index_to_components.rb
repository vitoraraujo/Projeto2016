class AddIndexToComponents < ActiveRecord::Migration
  def change
  	add_index :components, [:post_id, :resource_id]
  end
end
