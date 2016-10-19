class Post < ActiveRecord::Base
	belongs_to :user
    default_scope -> { order(created_at: :desc) }
	validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
	validates :description, presence: true, length: { maximum: 250 }
	validates :user_id, presence: true
	has_many :steps, dependent: :destroy
	has_many :components, dependent: :destroy,
						  foreign_key: :post_id
	has_many :resources, through: :components
	has_many :comments, dependent: :destroy
	
end
