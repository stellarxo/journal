class User < ApplicationRecord

  has_many :entries

  attr_accessor :username, :email, :password, :password_confirmation
  validates :username, :presence => true, :uniqueness => true, :length => {:in => 3..20}
  validates :email, :presence => true, :uniqueness => true
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create

  before_save :encrypt_password
  after_save :clear_password

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end

end
