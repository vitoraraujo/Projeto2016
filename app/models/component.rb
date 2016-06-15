class Component < ActiveRecord::Base
	belongs_to :post
  	belongs_to :resource
end
