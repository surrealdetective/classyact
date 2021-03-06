class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation

  has_many :surveys

  has_secure_password
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, :uniqueness => true

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == Bcrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
