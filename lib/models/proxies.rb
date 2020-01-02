class Proxies < ActiveRecord::Base 
    has_many :proxies_accounts
    has_many :rsaccounts, through: :proxies_accounts
end
