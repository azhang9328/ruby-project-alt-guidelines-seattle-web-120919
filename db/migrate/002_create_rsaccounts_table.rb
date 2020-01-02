class CreateRsaccountsTable < ActiveRecord::Migration[5.1]
    def change
      create_table :rsaccounts do |t|
        t.string :login
        t.string :password
        t.string :username
        t.boolean :banned
      end
    end
  end