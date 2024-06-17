class User < ApplicationRecord
  has_secure_password

  validates_uniqueness_of :email
  validates :password, length: { minimum: 6, maximum: 20 }

  after_create_commit -> { broadcast_replace_to "users", partial: "users/user_count_message", locals: { user_count: User.count }, target: "users_count_message" }
end
