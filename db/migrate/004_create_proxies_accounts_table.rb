class CreateProxiesAccountsTable < ActiveRecord::Migration[5.1]
    def change
      create_table :proxies_accounts do |t|
        t.integer :proxy_id
        t.integer :rsaccount_id
      end
    end
  end