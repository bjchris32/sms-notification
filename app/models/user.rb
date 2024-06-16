class User < ApplicationRecord
  has_secure_password

  validates_uniqueness_of :email
  validates :password, length: { minimum: 6, maximum: 20 }
end
