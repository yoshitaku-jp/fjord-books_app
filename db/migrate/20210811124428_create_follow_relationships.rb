# frozen_string_literal: true

class CreateFollowRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :follow_relationships do |t|
      t.integer :follower_id
      t.integer :followee_id

      t.timestamps
    end
    add_index :relationships, :follower_id
    add_index :relationships, :followee_id
    add_index :relationships, %i[follower_id followee_id], unique: true
  end
end
