class Component < ActiveRecord::Base
	belongs_to :post
  	belongs_to :resource
  	validates :quantity, presence: true
end
