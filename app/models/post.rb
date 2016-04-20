class Post < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
	validates :description, presence: true, length: { maximum: 250 }
	validates :detail, presence: true
end
