class User < ActiveRecord::Base
  include BCrypt
  # Remember to create a migration!
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.validate_password(user, password)
    user && user.password == password
  end

end
