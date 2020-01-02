class CreateEmailsTable < ActiveRecord::Migration[5.1]
    def change
      create_table :emails do |t|
        t.string :login
        t.string :password
      end
    end
  end