# frozen_string_literal: true

class RenameFolloweeColumnToFollowed < ActiveRecord::Migration[6.1]
  def change
    rename_column :follow_relationships, :followee_id, :followed_id
  end
end
