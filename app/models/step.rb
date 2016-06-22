class Step < ActiveRecord::Base
	belongs_to :post
	validates :step, presence: true
end
