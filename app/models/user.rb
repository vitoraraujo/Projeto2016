class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	validates :name,  presence: true, length: { maximum: 20 }, uniqueness: true
  	validates :email, presence: true, length: { maximum: 35 }, email_format: { message: "doesn't look like an email address" }, uniqueness: true
  	has_secure_password
  	validates :password, presence: true, length: { maximum: 20 }
end
