class CreateProxiesTable < ActiveRecord::Migration[5.1]
    def change
      create_table :proxies do |t|
        t.string :ip_address
        t.integer :port
      end
    end
  end