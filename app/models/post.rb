class Post < ActiveRecord::Base
	belongs_to :user
    default_scope -> { order(created_at: :desc) }
	validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
	validates :description, presence: true, length: { maximum: 250 }
	validates :detail, presence: true
	validates :user_id, presence: true
end
