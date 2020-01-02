class CreateAssignmentsTable < ActiveRecord::Migration[5.1]
    def change
      create_table :assignments do |t|
        t.integer :proxy_id
        t.integer :rsaccount_id
      end
    end
  end