class Resource < ActiveRecord::Base
	has_many :components
	has_many :posts, through: :components
end
