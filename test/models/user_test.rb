# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#name_or_email' do
    user = User.new(email: 'foo@example.com', name: '')

    assert_equal 'foo@example.com', user.name_or_email

    user.name = 'Foo Bar'
    assert_equal 'Foo Bar', user.name_or_email
  end

  test '#follow?_and_#following?' do
    me = User.create!(email: 'me@example.com', password: 'password')
    she = User.create!(email: 'she@example.com', password: 'password')

    assert_not me.following?(she)
    me.follow(she)
    assert me.following?(she)
  end

  test '#unfollow?_and_#followed_by?' do
    me = User.create!(email: 'me@example.com', password: 'password')
    she = User.create!(email: 'she@example.com', password: 'password')

    me.follow(she)
    assert she.followed_by?(me)
    me.unfollow(she)
    assert_not she.followed_by?(me)
  end
end
