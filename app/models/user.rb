# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :followers, class_name: 'FollowRelationship',
                       foreign_key: 'follower_id',
                       dependent: :destroy
  has_many :followings, class_name: 'FollowRelationship',
                        foreign_key: 'followee_id',
                        dependent: :destroy
end
