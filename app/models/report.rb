# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  validates :title,:content, presence: true
end
