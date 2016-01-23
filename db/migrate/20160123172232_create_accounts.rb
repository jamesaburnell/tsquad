class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :consumer_key
      t.string :consumer_secret
      t.string :access_token
      t.string :access_token_secret

      t.timestamps null: false
    end
  end
end
