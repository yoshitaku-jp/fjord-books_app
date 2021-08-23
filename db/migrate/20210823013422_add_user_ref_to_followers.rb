# frozen_string_literal: true

class AddUserRefToFollowers < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :followers, :users, column: :follower_id
    add_foreign_key :followers, :users, column: :followed_id
  end
end
