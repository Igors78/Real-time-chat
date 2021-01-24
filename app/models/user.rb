# frozen_string_literal: true

class User < ApplicationRecord
  has_many :messages
  NAME_REGEX = /\w+/.freeze
  validates :username, presence: true, uniqueness: { case_sensitive: false },
                       format: { with: /\A#{NAME_REGEX}\z/i },
                       length: { maximum: 15 }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
end
