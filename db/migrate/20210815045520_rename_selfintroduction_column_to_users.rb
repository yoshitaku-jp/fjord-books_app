class RenameSelfintroductionColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :selfintroduction, :self_introduction
  end
end
