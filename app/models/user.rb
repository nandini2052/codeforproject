class User < ApplicationRecord
  # attr_accessible :title, :body
  attr_accessor :reset_token
  has_many :houses, dependent: :destroy
#  before_save {self.email = email.downcase}
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :username,
  presence: true, length: {minimum: 3, maximum: 25},
  uniqueness: {case_sensitive: false}

  validates :email,
  presence: true, length: {maximum: 75},
  uniqueness: {case_sensitive: false},
  format: {with: VALID_EMAIL_REGEX}

  has_secure_password
end
