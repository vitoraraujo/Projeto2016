class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	validates :name,  presence: true, length: { maximum: 20 } 
  	validates :email, presence: true, length: { maximum: 35 }, email_format: { message: "doesn't look like an email address" }
  	has_secure_password
  	validates :password, presence: true, length: { minimum: 20 }
end
