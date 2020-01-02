class Rsaccount < ActiveRecord::Base
    belongs_to :email
    has_many :proxies_accounts
    has_many :proxies, through: :proxies_accounts
end
