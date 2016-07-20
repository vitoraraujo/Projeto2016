class Component < ActiveRecord::Base
	belongs_to :post, :foreign_key => "post_id"
  	belongs_to :resource, :foreign_key => "resource_id"
  	validates :quantity, presence: true
end
