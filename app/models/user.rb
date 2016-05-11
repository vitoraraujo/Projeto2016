class User < ActiveRecord::Base
    attr_accessor :remember_token


	before_save { self.email = email.downcase }
	validates :name,  presence: true, length: { maximum: 20 }, uniqueness: true
	validates :email, presence: true, length: { maximum: 35 }, email_format: { message: "doesn't look like an email address" }, uniqueness: true
  has_secure_password
 	validates :password, presence: true, length: { maximum: 25 }, length: {minimum: 5}
  class << self
   	def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
  	  BCrypt::Password.create(string, cost: cost)
  	end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
