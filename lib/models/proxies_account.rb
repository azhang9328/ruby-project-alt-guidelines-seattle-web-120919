class Proxies_Account < ActiveRecord::Base
    belongs_to :rsaccount
    belongs_to :proxies
end