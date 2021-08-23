class ChangeFollowRelationshipToFollowers < ActiveRecord::Migration[6.1]
  def change
    rename_table :follow_relationships, :followers
  end
end
