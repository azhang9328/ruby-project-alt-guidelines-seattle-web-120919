class Proxies_Account < ActiveRecord::Base
    belongs_to :rsaccounts
    belongs_to :proxies
end