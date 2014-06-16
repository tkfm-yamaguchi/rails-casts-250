class User < ActiveRecord::Base
  attr_accessor :password

  before_save :encrypt_password

  validates :password,
    confirmation: true
  validates :password,
    presence: true, on: :create

  validates :email,
    presence: true,
    uniqueness: true

  class << self
    def authenticate(email, password)
      user = where(email: email).first

      if user && user.encrypted_password ==
        BCrypt::Engine.hash_secret(password, user.password_salt)
        user
      else
        nil
      end
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
