class AddPostalcodeAdressSelfintroductionToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :postalcode, :integer
    add_column :users, :address, :string
    add_column :users, :selfintroduction, :text
  end
end
