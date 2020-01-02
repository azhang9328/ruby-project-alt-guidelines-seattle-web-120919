class Proxy < ActiveRecord::Base 
    has_many :proxies_accounts
    has_many :accounts, through: :proxies_accounts
end
