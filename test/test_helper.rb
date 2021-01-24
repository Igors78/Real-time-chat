# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
require 'rails/test_help'
require 'minitest/reporters'
Minitest::Reporters.use!

# Returns the hash digest of the given string.
def digest(string)
  BCrypt::Password.create(string, cost: BCrypt::Engine::MIN_COST)
end

module ActiveSupport
  class TestCase
    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    def is_logged_in?
      !cookies['user_id'].empty?
    end
  end
end

module ActionDispatch
  class IntegrationTest
    def login_as(user, password: 'password')
      post login_url, params: { session: { username: user.username,
                                           password: password } }
    end
  end
end
